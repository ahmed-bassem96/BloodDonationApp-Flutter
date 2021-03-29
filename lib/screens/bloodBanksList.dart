import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qq/screens/BloodBankProfile.dart';
import '../appBar_widget.dart';
import 'cityBanksList.dart';
import 'bloodRequestForm.dart';
 
class bloodBanklistScreen extends StatefulWidget {
  
   final  String myObject;
  
  bloodBanklistScreen({Key key, @required this.myObject,my}): super(key: key);
   @override
  
  _bloodBanklistScreenState createState() => _bloodBanklistScreenState();
}
 
    
class _bloodBanklistScreenState extends State<bloodBanklistScreen> {
  String info;
    final GlobalKey<ScaffoldState> _key2 = GlobalKey<ScaffoldState>();
 
  @override  

  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key2,
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
                      /* Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new BloodBank()));*/
                    },
                    title: Text(
                      "blood requests",
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
                    onTap: () {
                      /*  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new ProfilePage()));*/
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
                      /* Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new Articles()));*/
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
                    onTap: () {
                       Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => requestForm()));
                    },
                    title: Text(
                      "need blood?",
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
    
          body:StreamBuilder(
        stream: Firestore.instance.collection(widget.myObject).snapshots(),
        builder: (context,snapshot) {
          if (!snapshot.hasData) return Text('Loading Data..');

          return new ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.documents.length,
            padding: const EdgeInsets.only(top: 5.0),
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
             

              return ListTile(
                leading: Icon(Icons.local_pharmacy),
                title:Text(ds["name"]),
                subtitle: Text(ds["address"]),
                
              //  trailing: IconButton(icon :Icon(Icons.phone),onPressed: _callPhone,),
onTap: ()=>{
 
   info=ds.documentID.toString(),
   Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (__) =>  bloodBankProfile(bankId:info,collection: widget.myObject,)))       
 // print(ds.documentID.toString())
},
              );
            },
          );

        }
    ), 
      
    );
  }
}