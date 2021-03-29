import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String bloodType = '';
  final _formkey = GlobalKey<FormState>();
  TextEditingController _namecontroller = TextEditingController(); //name
  TextEditingController _emailcontroller = TextEditingController(); //email
  TextEditingController _passwordcontroller =TextEditingController(); //password
  TextEditingController _mobilecontroller = TextEditingController(); //mbile
  TextEditingController _agecontroller = TextEditingController(); //age
  TextEditingController _nationalidcontroller = TextEditingController(); //national id
  TextEditingController _citycontroller = TextEditingController(); //citty
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Sign Up ',
          style: TextStyle(color: Colors.redAccent),
        ),
        leading:
           
            IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            })); //Navigator
          },
          alignment: Alignment.centerLeft,
          color: Colors.redAccent,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                controller: _namecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your name';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Full Name',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _emailcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your email';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'email',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _passwordcontroller,
                validator: (value) {
                  if (value.length < 6) {
                    return 'password must be at least 7 digits';
                  }
                },
                obscureText: true,
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'password',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _mobilecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your phone number';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Phone number',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _agecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your age';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Age',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _nationalidcontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your national ID';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white, ///////national id
                  labelText: 'National ID',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _citycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter your city';
                  }
                },
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'City',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
             SizedBox(height: 10.0),
             Row(
               children:<Widget>[ Text(
             "Blood Group",
             textAlign:TextAlign.center,
             style:new TextStyle(
               fontSize:30.0
             ),
           ),
               ]
           ), 
               Container(
                margin: EdgeInsets.symmetric(vertical:10.0),
                height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:<Widget>[
                MaterialButton(
                  onPressed: () {
                    bloodType = 'A+';
                  },
                  color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('A+'),
                  padding: EdgeInsets.all(15),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'B+';
                  },
                  color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('B+'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'O+';
                  },
                   color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('O+'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'AB+';
                  },
                   color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('AB+'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'A-';
                  },
                  color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('A-'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'O-';
                  },
                   color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('O-'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'B-';
                  },
                   color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('B-'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'B-';
                  },
                  color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('B-'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    bloodType = 'AB-';
                  },
                   color: Colors.redAccent,
                  splashColor: Colors.white,
                  textColor: Colors.black,
                  child: Text('AB-'),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                    ]
              )
              ),
               SizedBox(height: 40.0),
              RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text("Next"),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    var result = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text);
                    if (result != null) {
                      var userInfo = Firestore.instance
                          .collection('users')
                          .document(result.uid)
                          .setData({
                        'name': _namecontroller.text,
                        'email': _emailcontroller.text,
                        'phone': _mobilecontroller.text,
                        'age': _agecontroller.text,
                        'national id': _nationalidcontroller.text,
                        'city': _citycontroller.text,
                        'Blood Type': bloodType
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    } else {
                      print('please try again');
                    }
                  }
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
              ),
              //SizedBox(height: 40.0),
             
            ],
          ),
        ),
      ),
    );
  }
}
