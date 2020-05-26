import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:sportbabe/components/camera/verification_result.dart';
import 'dart:convert';
import '../login/sign_in.dart';

import 'package:sportbabe/components/restapi.dart';

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;

  PreviewImageScreen({this.imagePath});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

String imgPath = '';

class _PreviewImageScreenState extends State<PreviewImageScreen> {

  Color _myColor = Color(0xff553c8b);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Foto'),
        backgroundColor: _myColor,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
            SizedBox(height: 10.0),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: RaisedButton(
                  onPressed: () {
                    imgPath = widget.imagePath;
                    //upload(File(widget.imagePath));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => verificationResult(path: imgPath)));
                  },
                  child: Text('Upload'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}

class UploadPhoto {
  String respValue = '';
  Future<String> upload(File imageFile) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("https://sportbabe-api.herokuapp.com/verification");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('img', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    // print(response.stream.bytesToString());
    print(response.contentLength);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print('Disini testing value respons');
      print(value);
      respValue = value;
      putUsersVerified(getUid());
    });
    
    return respValue;
  }

  String getHasil(){
    return respValue;
  }
}

String getImgPath(){
  return imgPath;
}