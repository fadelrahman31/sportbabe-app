import 'package:flutter/material.dart';
import 'package:sportbabe/components/bookings.dart';
import 'home.dart';
import 'vonny.dart';
import 'profile.dart';


Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF553c8b, color);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportBabe',
      theme: ThemeData(
          primarySwatch: colorCustom,
          brightness: Brightness.light,
          fontFamily: 'Nunito'
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget{
  const MyHome({Key key}): super(key: key);

  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<MyHome>{
  int _currentTabIndex =0;

  Widget build(BuildContext context){
    final _kTabPages = <Widget>[
      Center(
        child: new HomeBuilder(),
      ),
      Center(
        child: new BookingPage(),
      ),
      Center(
        child: new ProfilePage(),
      ),
    ];

    final _kBottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          title: Text('HOME'),
          icon: Icon(Icons.home)
      ),
      BottomNavigationBarItem(
          title: Text('BOOKINGS'),
          icon: Icon(Icons.history)
      ),

      BottomNavigationBarItem(
          title: Text('PROFILE'),
          icon: Icon(Icons.account_circle)
      ),
    ];
    assert(_kTabPages.length == _kBottomNavbarItem.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavbarItem,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('SPORTBABE',
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 15.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(125, 0, 0, 255),
                  ),
                ]
            )
        ),
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: bottomNavBar,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VonnyPageBuilder()),
          );
        },
        child: Icon(Icons.bubble_chart),
        backgroundColor: Color(0xFF553c8b),
      ),
    );
  }
}