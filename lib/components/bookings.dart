import 'active_booking.dart';
import 'package:flutter/material.dart';
import 'history.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new TabBar(tabs: [
                      Tab(text: "Active Booking"),
                      Tab(text: "History")
                    ]),
                  ]),
            ),
            body: TabBarView(
              children: <Widget>[
                ActiveBooking(),
                History(),
              ],
            )));
  }
}