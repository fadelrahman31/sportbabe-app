import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class bookPage extends StatefulWidget{
  @override
  _bookPageState createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {

  DateTime tgl = new DateTime.now();
  DateTime waktu = new DateTime.now();
  DateTime waktuFinish = new DateTime.now();
  String parseDate(DateTime a){
    var formatter = new DateFormat('yMMMd');
    String formatted = formatter.format(a);
    return formatted;
  }
  String parseTime(DateTime a){
    var formatter = new DateFormat('jm');
    String formatted = formatter.format(a);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Now!'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('GOR Saparua', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'images/pic1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Kategori : Badminton', style: TextStyle(fontStyle: FontStyle.italic),),
                ),
              )
            ],
          ),
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Tanggal Book", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    FlatButton(
                        onPressed: () {
//                          DatePicker.showDatePicker(context,
//                              showTitleActions: true,
//                              minTime: DateTime(2010, 1, 1),
//                              maxTime: DateTime(2020, 12, 31),
//                              onChanged: (date) {
//                                print('change $date');
//                                setState(() {
//                                  tgl = date;
//                                });
//                              }, onConfirm: (date) {
//                                print('confirm $date');
//                                setState(() {
//                                  tgl = date;
//                                });
//                              }, locale: LocaleType.id);
                        },
                        child: Text(
                          'Choose Date',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                  child: Container(
                    child: Text(parseDate(tgl), style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Waktu Booking", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: Container(
                        child: Text(parseTime(waktu), style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
//                          DatePicker.showTimePicker(context,
//                              showTitleActions: true,
//                              onChanged: (date) {
//                                print('change $date');
//                                setState(() {
//                                  waktu = date;
//                                });
//                              }, onConfirm: (date) {
//                                print('confirm $date');
//                                setState(() {
//                                  waktu = date;
//                                });
//                              }, locale: LocaleType.id);
                        },
                        child: Text(
                          'Choose Start Time',
                          style: TextStyle(color: Colors.blue),
                        )),

                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: Container(
                        child: Text(parseTime(waktuFinish), style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
//                          DatePicker.showTimePicker(context,
//                              showTitleActions: true,
//                              onChanged: (date) {
//                                print('change $date');
//                                setState(() {
//                                  waktuFinish = date;
//                                });
//                              }, onConfirm: (date) {
//                                print('confirm $date');
//                                setState(() {
//                                  waktuFinish = date;
//                                });
//                              }, locale: LocaleType.id);
                        },
                        child: Text(
                          'Choose Finish Time',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Total Harga", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Rp 75.000', style: TextStyle(fontSize: 18),),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: const Text('Cancel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                onPressed: () {/*...*/},
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)
                ),
                child: const Text('Book!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                color: Colors.green,
                onPressed: () {/*...*/},
              )
            ],
          )
        ],
      )
    );
  }
}