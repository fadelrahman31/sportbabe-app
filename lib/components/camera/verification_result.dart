import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'preview_screen.dart';

class verificationResult extends StatefulWidget {
  final String path;

  verificationResult({this.path});

  @override
  _verificationResultState createState() => _verificationResultState();
}


class _verificationResultState extends State<verificationResult> {
  Color _myColor = Color(0xff553c8b);
  UploadPhoto uploadPhoto;

  @override
  void initState() {
    super.initState();
    uploadPhoto = UploadPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Result'),
        backgroundColor: _myColor,
      ),
      body: SafeArea(
        //child: Text(widget.path),
        child: FutureBuilder(
          future: uploadPhoto.upload(File(widget.path)),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    'Something wrong with message: ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  children: <Widget>[
                    Text(uploadPhoto.getHasil()),
//                    RaisedButton(
//                      color: Colors.green,
//                      child: Text('Go Back to Home Page!'),
//                      onPressed: (){
//                        Navigator.of(context).push(
//                            MaterialPageRoute(
//                                builder: (context){
//                                  putUsersVerified(getUid());
//                                  return MyApp();
//                                }
//                            )
//                        );
//                      },
//                    )
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Akun anda telah terverifikasi!',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                )
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Tekan tombol back untuk kembali ke halaman Profile',
                                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                                )
                            )
                        ),
                      ],
                    )
                  ],
                );
              return Text(snapshot.data);
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