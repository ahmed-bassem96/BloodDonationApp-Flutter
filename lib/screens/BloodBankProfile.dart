import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qq/screens/rquestList.dart';
import '../appBar_widget.dart';
import 'bloodRequestForm.dart';
import 'cityBanksList.dart';
import 'map.dart';
import 'bloodBanksList.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:location/location.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class bloodBankProfile extends StatefulWidget {
  final String bankId;
  final String collection;

  bloodBankProfile({Key key, @required this.bankId, @required this.collection})
      : super(key: key);

  @override
  _bloodBankProfileState createState() => _bloodBankProfileState();
}

class _bloodBankProfileState extends State<bloodBankProfile> {
   Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,//1
    Colors.blue,//2
    Colors.yellow,//3
    Colors.white,//4
    Colors.green,//5
    Colors.teal,//6
    Colors.grey,//7
    Colors.purple,//8
    Colors.blueGrey


    
  ];
  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("A+", () => 5);
    dataMap.putIfAbsent("B+", () => 3);
    dataMap.putIfAbsent("O+", () => 2);
    dataMap.putIfAbsent("AB+", () => 2);
    dataMap.putIfAbsent("A-", () => 6);
    dataMap.putIfAbsent("B-", () => 7);
    dataMap.putIfAbsent("O-", () => 8);
    dataMap.putIfAbsent("AB", () => 9);
    dataMap.putIfAbsent("plasma", () => 9);
    
  }
 final GlobalKey<ScaffoldState> _key3 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
              title: "blood banks list  ",
              backGroundColor: Colors.white,
              leftIcon: null,
              onPressedLeft: (){
               
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
                                        builder: (context) => cityList()));
            }),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection(widget.collection)
                .document(widget.bankId)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              var userDocument = snapshot.data;

              return new Center(
                //crossAxisAlignment: CrossAxisAlignment.center,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                 <Widget>[
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 100.0),
                     /* width: 10.0,
                      height: 100.0,*/
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                  "https://3.imimg.com/data3/DK/OS/MY-10166873/blood-bank-500x500.jpg"))),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 50.0),
                        RaisedButton(
                          //padding: EdgeInsets.all(0),
                          textColor: Colors.white,
                          color: Colors.redAccent,
                          child: Text(" need Blood? "),

                          ///need blood
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          onPressed: () {},
                        ),

                        SizedBox(width: 30.0), /////////mapppps
                        RaisedButton(
                          // padding: EdgeInsets.all(0),
                          textColor: Colors.white,
                          color: Colors.redAccent,
                          child: Text("get directions"),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          onPressed: () async {
                            Location location = new Location();

                            bool _serviceEnabled;
                            PermissionStatus _permissionGranted;
                            LocationData _locationData;

                            _serviceEnabled = await location.serviceEnabled();
                            if (!_serviceEnabled) {
                              _serviceEnabled = await location.requestService();
                              if (!_serviceEnabled) {
                                return;
                              }
                            }

                            _permissionGranted = await location.hasPermission();
                            if (_permissionGranted == PermissionStatus.denied) {
                              _permissionGranted =
                                  await location.requestPermission();
                              if (_permissionGranted !=
                                  PermissionStatus.granted) {
                                return;
                              }
                            }

                            _locationData = await location.getLocation();
                           

                            await Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => bankmap(
                                        lat: _locationData.latitude,
                                        long: _locationData.longitude,
                                        uid:widget.bankId
                                        )));
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        SizedBox.fromSize(
                          /////call button
                          size: Size(50, 50), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor: Colors.redAccent, // splash color
                                onTap: () {
                                  final phone =
                                      FlutterPhoneState.startPhoneCall(
                                          userDocument["number"]);
                                  // print(widget.bankId.toString());
                                }, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    ),
                                    Text("Call") // icon
                                    // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                         userDocument["phone"],
                            style: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20.0)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          ////addresse
                          //SizedBox(width: 5.0),
                          Icon(
                              Icons.home,
                              color: Colors.red[700],
                              size: 40,
                            ),
                          Flexible(
                              child: Text(userDocument["address"],
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0))),
                        ],
                      ),
                    ),
                     Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child:RatingBar(
                         initialRating: 3,
    itemCount: 5,
    itemBuilder: (context, index) {
       switch (index) {
          case 0: 

             return Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
             );
          case 1:
             return Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.redAccent,
             );
          case 2:
             return Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
             );
          case 3:
             return Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
             );
          case 4:
              return Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              );
       }
    },
    onRatingUpdate: (rating){
      double cc1,cc2;
      double count=0.0;
      double avg;
      double tot;
            
        Firestore.instance
                .collection(widget.collection)
                .document(widget.bankId)
                .snapshots();
                 cc1=1.0+userDocument["rate1"];
                 cc2=2.0+userDocument["rate2"];
                 count ++;
                  tot=cc1+cc2;
                  avg=tot/count;
                Firestore.instance
                .collection(widget.collection)
                .document(widget.bankId)
                .updateData({
                  'rate1':cc1,
                  'rate2':cc2

                });

     print(avg);
    },)
                    ),
                    //Container(child:)
                     SizedBox(height: 20.0),
                    Container(
                      child:PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  showChartValuesInPercentage: false,
                  showChartValues: true,
                  showChartValuesOutside: true,
                 // chartValueBackgroundColor: Colors.grey[200],
                  colorList: colorList,
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                  decimalPlaces: 1,
                  showChartValueLabel: false,
                  initialAngle: 0,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                    color: Colors.blueGrey[900].withOpacity(0.9),
                  ), 
       chartType: ChartType.disc,
        ),
         ),
          
                  ],
                ),
              
              );
            }));
  }
}
