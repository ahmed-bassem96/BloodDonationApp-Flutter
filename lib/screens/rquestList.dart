import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:qq/screens/bloodRequestForm.dart';
import 'package:qq/screens/chat.dart';
import 'package:qq/screens/cityBanksList.dart';
import '../appBar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'UserProfile.dart';
import 'articls.dart';
import 'package:toast/toast.dart';


class requestList extends StatefulWidget {
  
  @override
  _requestListState createState() => _requestListState();
}

class _requestListState extends State<requestList> {
 
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: WaveAppBar(
          title: "requests ",
          backGroundColor: Colors.white,
          leftIcon: Icons.menu,
          onPressedLeft: () {
            _key.currentState.openDrawer();
          },
          onPressedRight: null,
          directionOfRightIcon: TextDirection.ltr,
          rightIcon: null,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            backgroundColor: Colors.redAccent,
            onPressed: () {
              Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => requestForm()));
            }),
        drawer: Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.redAccent,
                child: DrawerHeader(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/ic_launcher.png",
                    )
                  ],
                )),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: ListTile(
                    onTap: () {
                       Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => cityList()));
                    },
                    title: Text(
                      "Blood Banks",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    leading: Icon(Icons.local_hospital,
                        size: 30, color: Colors.red[900]),
                    trailing: null,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: null,
                child: Container(
                  child: ListTile(
                    onTap: ()async {
                      var user= await FirebaseAuth.instance.currentUser();
                      String userId=user.uid.toString();

                        Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            userprof(userID:userId.toString())));
                    },
                    title: Text(
                      "personal profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    leading: Icon(Icons.account_circle,
                        size: 30, color: Colors.redAccent),
                    trailing: null,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: null,
                child: Container(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => AllArticls()));
                    },
                    title: Text(
                      "Articls",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    leading: Icon(Icons.description,
                        size: 30, color: Colors.red[900]),
                    trailing: null,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: null,
                child: Container(
                  child: ListTile(
                    onTap: (){
                       Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => Chat()));
                      
                    },
                    title: Text(
                      "public chat",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    leading: Icon(Icons.chat,
                        size: 30, color: Colors.red[900]),
                    trailing: null,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: null,
                child: Container(
                  child: ListTile(
                    onTap: ()async{
                      Toast.show("request accomplished", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      
                      var user=await FirebaseAuth.instance.currentUser();
                      

                     Firestore.instance.collection('posts').document(user.uid).delete();
                    },
                    title: Text(
                      "end request",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    leading: Icon(Icons.description,
                        size: 30, color: Colors.red[900]),
                    trailing: null,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Loading Data..');

              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  padding: const EdgeInsets.only(top: 5.0),
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];

                    return Card(
                      elevation: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(children: <Widget>[
                            SizedBox(width: 170.0),
                            Text(ds["bloodGroup"], ///////blood group
                                style: TextStyle(
                                    color: Colors.red[500],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .3))
                          ]),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Icon(
                              Icons.accessibility_new,
                              color: Colors.red[700],
                              size: 20,
                            ),
                            Text('number of bags: ' + ds["number of bags"])
                          ]),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors.red[700],
                              size: 20,
                            ),
                            Text('Name: ' + ds["paient name"])
                          ]),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.red[700],
                              size: 20,
                            ),
                            SelectableText(ds["phone"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent,
                                    fontSize: 16,
                                    letterSpacing: .3), onTap: () {
                              final phone =
                                  FlutterPhoneState.startPhoneCall(ds["phone"]);
                              //print('hi');
                            })
                          ]),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.red[700],
                              size: 20,
                            ),
                          ]),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Icon(
                              Icons.note_add,
                              color: Colors.red[700],
                              size: 20,
                            ),
                              SizedBox(width: 0.6),
                            Flexible(child: Text('notes: ' + ds["notes"]))
                          ]),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              Text("share request with:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      letterSpacing: .3)),
                              InkWell(
                                onTap: () {
                                  String bg = ds["bloodGroup"];
                                  String n = ds["paient name"];
                                  String nu = ds["phone"];
                                  FlutterShareMe().shareToWhatsApp(
                                      msg: "A BLOOD DONOR IS REQUIRED\n"
                                          "blood type: $bg\n"
                                          "name:$n \n"
                                          "phone:$nu");
                                },
                                child: Tab(
                                    icon: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          "assets/images/ww.jpg",
                                          height: 40,
                                          width: 40,
                                        ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }
}
