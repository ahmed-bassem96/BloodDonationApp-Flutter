import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qq/screens/rquestList.dart';
import 'package:wave_progress_bars/wave_progress_bars.dart';
import 'package:wave/wave.dart';
import '../appBar_widget.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';

class requestForm extends StatefulWidget {
  @override
  _requestFormState createState() => _requestFormState();
}

class _requestFormState extends State<requestForm> {

   TextEditingController _phone = TextEditingController(); //phone number
  TextEditingController _paitentname = TextEditingController(); //email
  TextEditingController _numberOfBags =TextEditingController(); //password
  TextEditingController _notes = TextEditingController();
  String chosenGroup;
  var _bloodGroup = [
    'Any Group',
    'AB+',
    "AB-",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "Plasma"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: WaveAppBar(
              title: "request Form ",
              backGroundColor: Colors.white,
              leftIcon: null,
              onPressedLeft: (){             
               /* Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new BloodBank()));*/
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
                                        builder: (context) => requestList()));
              }
              ),

            body: SingleChildScrollView(
             child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          top: 14,
                        ),
                        child: DropdownButtonFormField<String>(
                          isDense: true,
                          decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              labelText: 'blood Group',
                              labelStyle: TextStyle(
                               
                              )),
                          iconSize: 32,
                          isExpanded: true,
                          items:
                              _bloodGroup.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Center(
                                child: Text(
                                  dropDownStringItem,
                                  style: TextStyle(
                                    fontSize: 18,
                                    
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                            chosenGroup=newValueSelected;
                            });
                          
                            //print(chosenGroup.toString());
                            // Your code to execute, when a menu item is selected from drop down
                           // _onDropDownItemSelected(newValueSelected);
                          },
                          value: chosenGroup,
                        ),
                      ),
                       SizedBox(height: 20.0),
                      TextFormField(
                controller: _paitentname,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your phone number';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Patient Name',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
                      TextFormField(
               controller: _numberOfBags,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter  number of bags ';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'number of bags',
                  
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
               controller: _phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter phone number';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'phone number',
                  
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),

              Container(
                        padding: EdgeInsets.only(top: 17),
                        child:TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: null,
                          controller: _notes,                        
                          decoration: InputDecoration(
                            labelText: 'Notes',
                            
                            labelStyle: TextStyle(
                              
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),

                      RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text("post Request"),
                onPressed: () async {                
                    var user =await FirebaseAuth.instance.currentUser();
                    if (user != null) {
                       Firestore.instance
                          .collection('posts')
                          .document(user.uid)
                          .setData({
                            'bloodGroup':chosenGroup,
                            'paient name':_paitentname.text,
                            'number of bags':_numberOfBags.text,
                            'notes':_notes.text,
                            'phone':_phone.text
                      
                      });
                      
                      Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => requestList()));
                  
                    } 
                  
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
                    ]
            ),

    )
    );
  }
}