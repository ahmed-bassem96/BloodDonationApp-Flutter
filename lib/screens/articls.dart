import 'package:flutter/material.dart';
import 'package:qq/screens/rquestList.dart';
import 'package:url_launcher/url_launcher.dart';
import 'UrgentArticl.dart';
import '../appBar_widget.dart';

class AllArticls extends StatefulWidget {
  @override
  _AllArticlsState createState() => _AllArticlsState();
}

class _AllArticlsState extends State<AllArticls> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: WaveAppBar(
            title: "Articls",
            backGroundColor: Colors.white,
            leftIcon: null,
            onPressedLeft: () {},
            onPressedRight: null,
            directionOfRightIcon: TextDirection.ltr,
            rightIcon: null,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => requestList()));
              }),
          body: Container(
            color: Colors.grey[300],
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Urgent()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/88.jpg',
                            height: 250,
                            fit: BoxFit.fitWidth,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Blood donation .. facts and tips",
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: new BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "read",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.red[900]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL() async {
                      const url =
                          'https://www.moh.gov.sa/HealthAwareness/EducationalContent/Diseases/Hematology/Pages/009.aspx';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    _launchURL();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/33.jpg',
                            height: 250,
                            fit: BoxFit.fitWidth,
                          ),
                          Text(
                            "Why we donate with blood?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL() async {
                      const url =
                          'https://www.emaratalyoum.com/local-section/health/2013-12-13-1.631357';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    _launchURL();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/44.jpg',
                            height: 250,
                            fit: BoxFit.fitWidth,
                          ),
                          Text(
                            "Donor blood compensation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL() async {
                      const url =
                          'https://www.redcrossblood.org/donate-blood/blood-types.html';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    _launchURL();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/11.jpg',
                            height: 250,
                            fit: BoxFit.fitWidth,
                          ),
                          Text(
                            "connection between blood types",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL() async {
                      const url =
                          'https://www.mayoclinic.org/tests-procedures/blood-donation/about/pac-20385144#:~:text=Avoid%20fatty%20foods%2C%20such%20as,other%20fluids%20before%20the%20donation.';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    _launchURL();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/22.jpg',
                            height: 250,
                            fit: BoxFit.fitWidth,
                          ),
                          Text(
                            "Things to watch out for before donating blood",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
