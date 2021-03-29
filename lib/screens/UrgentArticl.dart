import 'package:flutter/material.dart';
import 'package:qq/screens/rquestList.dart';

import '../appBar_widget.dart';
import 'articls.dart';
class Urgent extends StatefulWidget {
  @override
  _UrgentState createState() => _UrgentState();
}

class _UrgentState extends State<Urgent> {
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
              appBar:  WaveAppBar(
              title: "Donation with blood",
              backGroundColor: Colors.white,
              leftIcon: null,
              onPressedLeft: (){
               _key.currentState.openDrawer();
              },
              onPressedRight: null,
              directionOfRightIcon: TextDirection.ltr,
              rightIcon: null,
            ), 
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.redAccent,
              onPressed: (){
                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => AllArticls()));
              }
              ),
              body: SafeArea(
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.only(
                        right: 15, bottom: 15, left: 15, top: 20),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(35))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, right: 23, bottom: 3),
                                  child: Text(
                                    "Benefits of donating blood:",
                                    style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 21,
                                        color: Colors.red[900]),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "Increased bone marrow activity to produce new blood cells (Red blood cells, white blood cells, and platelets) .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text("Increased blood circulation activity",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "Donating blood helps reduce iron levels in the blood because it is considered one of the causes of heart disease and clogged arteries",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-Studies have shown that people who donate their blood at least once a year are less likely to develop circulatory diseases and leukemia. .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 25, left: 25),
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, right: 23, bottom: 3),
                                  child: Text(
                                    "Conditions for donating blood:",
                                    style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 21,
                                        color: Colors.red[900]),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-The donor is in good health and does not suffer from any infectious diseases.",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "- The age of the donor should be 18-65 years . ",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-Donor weight should not be less than 50 kg .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-The percentage of hemoglobin for men is from 14 to 17 g and for women from 12 to 14 g .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "- The pulse is between 50-100 per minute .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-That the temperature does not exceed 37 ° C.",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "- Your blood pressure should be less than 120/80 mmHg .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-The donor does not have chronic diseases, such as diabetes, high blood pressure, or cancer .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 25, left: 25, bottom: 3),
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                                                                                                                                                       
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, right: 23, bottom: 3),
                                  child: Text(
                                    "Advices after donating blood :",
                                    style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 21,
                                        color: Colors.red[900]),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "- After donating, take a break and have a snack, and after 10-15 minutes you can leave the donation location .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-Avoid heavy physical activity or heavy lifting for 5 hours after donation. ",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text(
                                  "-When feeling dizzy, it is advised to lie on the back with feet elevated .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, left: 10),
                              child: Text("-To drink more fluids .",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 25, left: 25, bottom: 3),
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "One drop of your life for others!",
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}