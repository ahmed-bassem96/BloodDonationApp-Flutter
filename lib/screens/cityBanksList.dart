import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qq/screens/rquestList.dart';
import '../appBar_widget.dart';
import 'login.dart';
import 'bloodBanksList.dart';
import 'bloodRequestForm.dart';

class cityList extends StatefulWidget {
  @override
  _cityListState createState() => _cityListState();
}

class _cityListState extends State<cityList> {

  //var object;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
              title: "location of blood banks",
              backGroundColor: Colors.white,
              leftIcon: null,
              onPressedLeft:(){             
              },
              onPressedRight: null,
              directionOfRightIcon: TextDirection.ltr,
              rightIcon: null,
            ),
             floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            backgroundColor: Colors.redAccent,
            onPressed: () {
              Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => requestList()));
            }),
           // floatingActionButton: ,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: ListView(children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  "Cairo",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  //object='Cairo'
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              bloodBanklistScreen(myObject: 'Cairo')));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  "Giza",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return bloodBanklistScreen(myObject: 'Giza');
                  }));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  "Sinai",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bloodBanklistScreen(myObject: 'Sinai');
                  }));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  "Sharm El Shekh",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bloodBanklistScreen(myObject: 'Sharm El Shekh');
                  }));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  "Banha",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bloodBanklistScreen(myObject: 'Banha');
                  }));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
            ])));
  }
}
