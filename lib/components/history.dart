import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportbabe/components/login/sign_in.dart';
import 'restapi.dart';
import 'bookings.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin{
  ApiService apiService;
  Color _myColor = Color(0xff553c8b);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: apiService.getBookingsById(getUid()),
      builder: (BuildContext context, AsyncSnapshot<List<Bookings>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
                'Something wrong with message: ${snapshot.error.toString()}'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Bookings> bookings = snapshot.data;
          return _buildListView(bookings);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(List<Bookings> bookings) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              Bookings booking = bookings[index];

              String venueName(id_venue) {
                if (id_venue == 'abcde') {
                  return 'GOR Saparua';
                } else if (id_venue == 'vwxyz') {
                  return 'GOR Saraga ITB';
                } else {
                  return 'VINCEN PIKUN';
                }
              }

              String exerciseCategory(id_venue) {
                if (id_venue == 'abcde') {
                  return 'Badminton';
                } else if (id_venue == 'vwxyz') {
                  return 'Renang';
                } else {
                  return 'OLAHRAGA PERUT';
                }
              }

              if (booking.isFinished) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(venueName(booking.venue_id), style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Time: ' + booking.start_hour + ' - ' + booking.end_hour),
                        ),
                        Text('Booked at: ' + booking.booked_at),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: Text('Price: ' + booking.total_price, style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                FlatButton(
                                  child: Text(exerciseCategory(booking.venue_id), style: TextStyle(fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                    child: const Text('Done', style: TextStyle(color: Colors.white)),
                                    color: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    onPressed: () {

                                    })
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Text('');
              }
            }
        )
    );
  }
}