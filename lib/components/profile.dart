import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportbabe/components/login/sign_in.dart';
import 'package:sportbabe/components/login/login_page.dart';
import 'package:sportbabe/components/restapi.dart';
import 'camera/cam_main_screen.dart';

cetak(string) {
  print(string);
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String isUserVerified(String verify) {
    if (verify == 'true') { //isVerified true
      return 'VERIFIED ACCOUNT';
    } else { // isVerified false
      return 'NOT VERIFIED!';
    }
  }

  Color verifyColor(String verify) {
    if (verify == 'true') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  GetUserStats getUserStats;

  @override
  void initState(){
    super.initState();
    getUserStats = GetUserStats();
  }

  @override
  Widget build(BuildContext context) {
//    return ListView(
//      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//      children: <Widget>[
//        Card(
//          child: ListTile(
//            leading: Icon(
//              Icons.account_circle,
//              size: 60.0,
//            ),
//            title: Text(
//              getUserName(),
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            subtitle: Text(getEmail()),
//            trailing: SizedBox(
//                width: 40,
//                height: 50,
//                child: Center(
//                  child: FlatButton(
//                    child: Center(
//                      child: Icon(Icons.edit),
//                    ),
//                    onPressed: _buttonPressed,
//                    color: Colors.white,
//                    splashColor: Colors.transparent,
//                  ),
//                )),
//            isThreeLine: true,
//          ),
//        ),
//        Card(
//          child: ListTile(
//            leading: Icon(Icons.verified_user, color: verifyColor(getUserVerifStats(getUid()))),
//            title: Text(isUserVerified(getUserVerifStats(getUid())),
//              style: TextStyle(fontWeight: FontWeight.bold, color: verifyColor(getUserVerifStats(getUid()))),
//            ),
//          ),
//        ),
//        Card(
//          child: ListTile(
//            leading: Icon(Icons.account_balance_wallet),
//            title: Text(
//              'BEBEP Balance                           10000',
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.only(top: 20),
//          child: Text(
//            "Account",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//          ),
//        ),
//        Card(
//            child: InkWell(
//              onTap: (){
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => CameraApp()),
//                );
//              },
//              child: ListTile(
//                leading: Icon(Icons.person),
//                title: Text('Verify Your Account'),
//                trailing: Icon(Icons.arrow_right),
//              ),
//            )),
//        Card(
//            child: InkWell(
//              onTap: _buttonPressed,
//              child: ListTile(
//                leading: Icon(Icons.translate),
//                title: Text('Change Language'),
//                trailing: Icon(Icons.arrow_right),
//          ),
//        )),
//        Card(
//            child: InkWell(
//              onTap: _buttonPressed,
//              child: ListTile(
//                leading: Icon(Icons.help),
//                title: Text('Help'),
//                trailing: Icon(Icons.arrow_right),
//              ),
//            )
//          ),
//          Card(
//            child: InkWell(
//              onTap: (){
//                getUserVerifStats(getUid());
//              },
//              child: ListTile(
//                leading: Icon(Icons.tune),
//                title: Text('Setting'),
//                trailing: Icon(Icons.arrow_right),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(top: 20),
//            child: Text("General", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
//          ),
//        Card(
//          child: InkWell(
//            onTap: _buttonPressed,
//            child: ListTile(
//              leading: Icon(Icons.https),
//              title: Text('Privacy Policy'),
//              trailing: Icon(Icons.arrow_right),
//            ),
//          ),
//        ),
//        Card(
//          child: InkWell(
//            onTap: _buttonPressed,
//            child: ListTile(
//              leading: Icon(Icons.star_border),
//              title: Text('Rate Sportbabe'),
//              trailing: Icon(Icons.arrow_right),
//            ),
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.only(top: 40),
//        ),
//        RaisedButton(
//            color: Colors.deepPurpleAccent,
//            child: Text("TRY REST API",
//                style: TextStyle(
//                    fontWeight: FontWeight.bold, color: Colors.white)),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => restAPI()),
//              );
//            }),
//        RaisedButton(
//          color: Colors.redAccent,
//          child: Text("LOG OUT",
//              style:
//                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//          onPressed: () {
//            showDialog<String>(
//                context: context,
//                builder: (BuildContext context) => AlertDialog(
//                  title: Text('Attention!', style: TextStyle(fontWeight: FontWeight.bold),),
//                  content: Text('Are you sure want to log out from Sportbabe?'),
//                  actions: <Widget>[
//                    FlatButton(
//                      child: Text('No, stay signed in'),
//                      onPressed: () {
//                        Navigator.pop(context, 'Are you sure want to log out from Sportbabe?');
//                      },
//                    ),
//                    RaisedButton(
//                      color: Colors.red,
//                      child: Text('Yes, log me out', style: TextStyle(color: Colors.white),),
//                      onPressed: () {
//                        signOutGoogle();
//                        Navigator.of(context).push(
//                            MaterialPageRoute(
//                                builder: (context) {
//                                  return LoginPage();
//                                }
//                            )
//                        );
//                      },
//                    )
//                  ],
//                )
//              );
//            },
//          )
//        ],
//    );
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getUserStats.getUserVerifStats(getUid()),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text(
                    'Something wrong with message: ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done){
              return ListView(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 60.0,
                      ),
                      title: Text(
                        getUserName(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(getEmail()),
                      trailing: SizedBox(
                          width: 40,
                          height: 50,
                          child: Center(
                            child: FlatButton(
                              child: Center(
                                child: Icon(Icons.edit),
                              ),
                              onPressed: _buttonPressed,
                              color: Colors.white,
                              splashColor: Colors.transparent,
                            ),
                          )),
                      isThreeLine: true,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.verified_user, color: verifyColor(getUserStats.getStringStats())),
                      title: Text(isUserVerified(getUserStats.getStringStats()),
                        style: TextStyle(fontWeight: FontWeight.bold, color: verifyColor(getUserStats.getStringStats())),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text(
                        'BEBEP Balance                           10000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Account",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CameraApp()),
                          );
                        },
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Verify Your Account'),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      )),
                  Card(
                      child: InkWell(
                        onTap: _buttonPressed,
                        child: ListTile(
                          leading: Icon(Icons.translate),
                          title: Text('Change Language'),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      )),
                  Card(
                      child: InkWell(
                        onTap: _buttonPressed,
                        child: ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help'),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      )
                  ),
                  Card(
                    child: InkWell(
                      onTap: (){},
                      child: ListTile(
                        leading: Icon(Icons.tune),
                        title: Text('Setting'),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("General", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                  Card(
                    child: InkWell(
                      onTap: _buttonPressed,
                      child: ListTile(
                        leading: Icon(Icons.https),
                        title: Text('Privacy Policy'),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: _buttonPressed,
                      child: ListTile(
                        leading: Icon(Icons.star_border),
                        title: Text('Rate Sportbabe'),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  RaisedButton(
                      color: Colors.deepPurpleAccent,
                      child: Text("TRY REST API",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => restAPI()),
                        );
                      }),
                  RaisedButton(
                    color: Colors.redAccent,
                    child: Text("LOG OUT",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Attention!', style: TextStyle(fontWeight: FontWeight.bold),),
                            content: Text('Are you sure want to log out from Sportbabe?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('No, stay signed in'),
                                onPressed: () {
                                  Navigator.pop(context, 'Are you sure want to log out from Sportbabe?');
                                },
                              ),
                              RaisedButton(
                                color: Colors.red,
                                child: Text('Yes, log me out', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  signOutGoogle();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) {
                                            return LoginPage();
                                          }
                                      )
                                  );
                                },
                              )
                            ],
                          )
                      );
                    },
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
void _buttonPressed(){

}