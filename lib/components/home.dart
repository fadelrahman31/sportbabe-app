import 'package:flutter/material.dart';
import 'restapi.dart';
import 'login/sign_in.dart';
import 'bookPage.dart';

class HomeBuilder extends StatefulWidget{

  @override
  _HomeBuilderState createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  Widget _bodyContent(BuildContext context) => Center(
      child: Container(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.location_on),
                    label: Text('Bandung, ID'),
                    onPressed: (){
                      /*...*/
                    },
                )
            ],
        ),
      ),
    );

  final itemCarousel = ['Semua Olahraga', 'Futsal', 'Basket', 'Badminton', 'Tenis', 'Renang'];

  String defaultText = 'Semua Olahraga';
  Color _myColor = Color(0xff553c8b);
  String idSaparua = 'abcde';
  String idSaraga = 'vwxyz';

  GetUserStats getStats;

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        //Row 1
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: _bodyContent(context),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.attach_money),
                  label: Text('BEBEP'),
                  onPressed: (){

                  },
                )
              ],
            )
          ],
        ),
        Divider(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Hai, mau olahraga apa hari ini?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              )
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 55.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var i in itemCarousel) Container(
                margin: EdgeInsets.all(5.0),
                child: RaisedButton(
                  color: _myColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)
                  ),
                  child: Text(i, style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    setState(() {
                      defaultText = i;
                    });
                  },
                ),
              )
            ],
          )
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Kategori : $defaultText', style: TextStyle(fontStyle: FontStyle.italic),),
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'images/pic1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text('GOR Saparua', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Jl. Banda No.28, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                            child: const Text("Badminton", style: TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff9575cd),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)
                          ),
                          child: const Text('Pesan!'),
                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => bookPage()),
//                            );
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Confirmation!', style: TextStyle(fontWeight: FontWeight.bold),),
                                  content: Text('Do you confirm to book this place for 1 Hour at Tomorrow 09.00 AM?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RaisedButton(
                                      color: Colors.green,
                                      child: Text('Yes, Book me please!', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        postBooking(getUid(), idSaparua);
                                        Navigator.pop(context,'booked');
                                      },
                                    )
                                  ],
                                )
                            ).then((returnVal) {
                              if (returnVal != null) {
                                if (returnVal == 'booked') {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Successfully booked!'),
                                    action: SnackBarAction(
                                        label: 'OK',
                                        textColor: Colors.white,
                                        onPressed: () {}),
                                  ));
                                }
                              }
                            });
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
        ),
        Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'images/pic3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text('SARAGA ITB', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Jl. Siliwangi Dalam 3, Lb. Siliwangi, Kecamatan Coblong, Kota Bandung, Jawa Barat 40132'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                            child: const Text("Renang", style: TextStyle(fontWeight: FontWeight.bold))
                        )
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          color: Color(0xff9575cd),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)
                          ),
                          child: const Text('Pesan!'),
                          onPressed: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => bookPage()),
//                            );
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Confirmation!', style: TextStyle(fontWeight: FontWeight.bold),),
                                  content: Text('Do you confirm to book this place for 1 Hour at Tomorrow 09.00 AM?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RaisedButton(
                                      color: Colors.green,
                                      child: Text('Yes, Book me please!', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        postBooking(getUid(), idSaraga);
                                        Navigator.pop(context,'booked');
                                      },
                                    )
                                  ],
                                )
                            ).then((returnVal) {
                              if (returnVal != null) {
                                if (returnVal == 'booked') {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Successfully booked!'),
                                    action: SnackBarAction(
                                        label: 'OK',
                                        textColor: Colors.white,
                                        onPressed: () {}),
                                  ));
                                }
                              }
                            });
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
        )
      ],
    );
  }
}

class CardItems{
  String image;
  String nama;
  String alamat;

  CardItems(
    this.image, this.nama, this.alamat
  );

  @override
  String toString(){
    return '${this.image},${this.nama},${this.alamat}';
  }

}