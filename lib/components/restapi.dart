import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter/cupertino.dart';

class Users {
  final String id;
  final String email;
  final String nama;
  final String phone;
  final String registeredAt;

  Users({this.id, this.email, this.nama, this.phone, this.registeredAt});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'],
        email: json['email'],
        nama: json['nama'],
        phone: json['phone'],
        registeredAt: json['registered_at']
    );
  }

  @override
  String toString() {
    return 'Users{id: $id, email: $email, nama: $nama, phone: $phone, registered_at: $registeredAt}';
  }
}

class Bookings {
  final String id;
  final String user_id;
  final String venue_id;
  final String start_hour;
  final String end_hour;
  final String total_price;
  final String booked_at;
  final bool isFinished;

  Bookings({this.id, this.user_id, this.venue_id, this.start_hour,
    this.end_hour, this.total_price, this.booked_at, this.isFinished});

  factory Bookings.fromJson(Map<String, dynamic> json) {
    return Bookings(
      id: json['id'],
      user_id: json['user_id'],
      venue_id: json['venue_id'],
      start_hour: json['start_hour'],
      end_hour: json['end_hour'],
      total_price: json['total_price'],
      booked_at: json['booked_at'],
      isFinished: json['isFinished']
    );
  }

  @override
  String toString() {
    return 'Bookings{id: $id, user_id: $user_id, venue_id: $venue_id, start_hour: $start_hour, '
        'end_hour: $end_hour, total_price: $total_price, booked_at: $booked_at, isFinised: $isFinished}';
  }
}

List<Users> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody);
  final rest = parsed['results'] as List;
  print(rest);
  return rest.map<Users>((json) => Users.fromJson(json)).toList();
}

List<Bookings> parseBookings(String responseBody) {
  final parsed = json.decode(responseBody);
  final rest = parsed['results'] as List;
  print(rest);
  return rest.map<Bookings>((json) => Bookings.fromJson(json)).toList();
}

postUsersByID(String googleUID, String uName, String uEmail) async {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client2 = Client();
  var user = new Map<String, dynamic>();
  user['email'] = uEmail;
  user['id']    = googleUID;
  user['nama']  = uName;
  user['phone'] = '';
  user['registered_at'] = DateTime.now().toString();
  print('HASIL DIBAWAH INI DARI RESTAPI');
  print(user['id']);
  print(user['id'].runtimeType);
  print(user);

  final response = await client2.post('$baseURL/users',
    body: user
  );
  if(response.statusCode == 200){
    print("Post Data User Berhasil!");
  }else{
    throw Exception('Failed to Post Data User!');
  }
}

postBooking(String googleUID, String idVenue) async {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client2 = Client();
  var book = new Map<String, dynamic>();
  book['user_id'] = googleUID;
  book['venue_id']    = idVenue;
  book['start_hour']  = '09:00:00';
  book['end_hour'] = '10:00:00';
  book['total_price'] = '45000';
  book['isFinished'] = 'False';
  //print('HASIL DIBAWAH INI DARI RESTAPI');
  //print(user['id']);
  //print(user['id'].runtimeType);
  print(book);

  final response = await client2.post('$baseURL/bookings',
      body: book
  );
  if(response.statusCode == 200){
    print("Post Data Booking Berhasil!");
  }else{
    throw Exception('Failed to Post Booking User!');
  }
}

putUsersVerified(String googleUID) async {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client1 = Client();

  final response = await client1.put('$baseURL/users?id=$googleUID');
  final parsed   = json.decode(response.body);
  final status   = parsed['status'];

  if(status == 200){
    print('Pengguna berhasil diVerifikasi!');
  }else if(status == 400){
    print('Gagal verifikasi pengguna');
  }else{
    throw Exception('Failed from Server');
  }

}

//Function to Check User's Data Existence
Future<Users> getUserByID(String googleUID, String uName, String uEmail) async {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client1 = Client();

  final response = await client1.get('$baseURL/users?id=$googleUID');
  final parsed = json.decode(response.body);
  final status = parsed['status'];
  print(status);
  print(status.runtimeType);

  if(status == 400){
    postUsersByID(googleUID, uName, uEmail);
    //print(parsed);
  } else {
    print('Data sudah ada di Database!');
  }
}


class GetUserStats {
  String stringStats = '';
  Future<String> getUserVerifStats(String googleUID) async {
    final String baseURL = 'https://sportbabe-api.herokuapp.com';
    Client client1 = Client();

    final response = await client1.get('$baseURL/users?id=$googleUID');
    final parsed   = json.decode(response.body);
    final results  = parsed['results'];
    final isVerif  = results['isVerified'];

    print("------- DISINI TESTING VERIF STATUS ----------");
    print(isVerif);
    print(isVerif.runtimeType);
    stringStats = isVerif.toString();
    print(stringStats);
    print(stringStats.runtimeType);
    //return isVerif;
    return stringStats;
  }

  String getStringStats(){
    return stringStats;
  }
}

class ApiService {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client = Client();

  Future<List<Users>> getUsers() async {
    final response = await client.get('$baseURL/users');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseUsers(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Bookings!');
    }
  }

  Future<List<Bookings>> getBookingsById(String userID) async {
    final response = await client.get('$baseURL/bookings?user=$userID');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseBookings(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users!');
    }
  }
}

class restAPI extends StatefulWidget {
  @override
  _restAPIState createState() => _restAPIState();
}

class _restAPIState extends State<restAPI> {
  ApiService apiService;
  Color _myColor = Color(0xff553c8b);

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
        backgroundColor: _myColor,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiService.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    'Something wrong with message: ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Users> users = snapshot.data;
              return _buildListView(users);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ) ;
  }

  Widget _buildListView(List<Users> users) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(itemBuilder: (context, index) {
        Users user = users[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.nama,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                  Text(user.id),
                  Text(user.email),
                  Text(user.phone)
                ],
              ),
            ),
          ),
        );
      },
        itemCount: users.length,
      ),
    );
  }
}