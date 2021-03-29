import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qq/screens/rquestList.dart';
import 'package:toast/toast.dart';
import 'bloodBanksList.dart';
import 'chat.dart';
import 'register.dart';
import 'cityBanksList.dart';
import 'package:gradient_text/gradient_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

 

class _LoginScreenState extends State<LoginScreen> {
   void initState()
  {
    super.initState();
  }
  final _formkey = GlobalKey<FormState>(); 
 TextEditingController _emailcontroller=TextEditingController();
 TextEditingController _passwordcontroller=TextEditingController();
 String error=' ';

 
  @override
  var _auth=FirebaseAuth.instance.currentUser();
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
        
       body: Container( 
         padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
         decoration: BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
                      Color.fromRGBO(255, 77, 77, 0.9),
                      Color.fromRGBO(255, 77, 77, 0.9),
                      Color.fromRGBO(255, 33, 122, 0.9),
                      Color.fromRGBO(255, 33, 122, 0.9),
                    ],
    )
    ),
    
       child:Form(
         key: _formkey,
         child: ListView(

         children: <Widget>[
           Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    width: 150,
                    height: 150,
                  ),
                ),
                height: 154,
              )),
              Positioned(
                child: Container(
                    height: 154,
                    child: Align(
                      child: GradientText(
                        "LifeQuest",
                        gradient: LinearGradient(
    colors: [Colors.redAccent, Colors.orange, Colors.pink]),
 
                        style: TextStyle(
                          fontSize: 35.5,
                          fontWeight: FontWeight.bold,
                          
                         
                        ),
                      ),
                    )),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.height * 0.046,
                right: MediaQuery.of(context).size.width * 0.22,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.32,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ), 
          
           SizedBox(height:40.0),
           TextFormField(
             controller: _emailcontroller,
             validator: (value){
               if(value.isEmpty){
                 return 'please entre email';
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
           SizedBox(height:40.0),
           TextFormField(
             controller: _passwordcontroller,
             obscureText: true,
             validator: (value){ 
               
               if(value.length<6){
               return 'must be at least 7 digits';
               
             }
             },
             decoration: new InputDecoration(

               fillColor: Colors.red,
               
               labelText: 'password',

               border: new OutlineInputBorder(             
                 borderRadius: new BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),
               ),
             ),
           ),
           SizedBox(height:40.0),
           RaisedButton(
             textColor: Colors.redAccent,
             color: Colors.white,
             child: Text('SignIn'),
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
             padding:EdgeInsets.all(20),
             onPressed: ()async{
                
                
               if(_formkey.currentState.validate()){ 
                 var result= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
               
                Toast.show("request accomplished", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                   Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            
                        return requestList();
                         
                      
                      }));
                 
                
             }
                 
                 
                         
               
              },
             shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(50.0),
           )
           ),

            SizedBox(height:30.0),
           RaisedButton(                 /////////////register
             textColor: Colors.redAccent,
             color: Colors.white,
             child: Text('Register'),
          
             padding:EdgeInsets.all(20),
             onPressed: (){
               //toggleFormMode();
              Navigator.push(context, MaterialPageRoute(
                builder:(context){
                  return Register();
                }
              )             
              );
               
              },
             shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(50.0),
           )
           ),
           SizedBox(height:50.0),
           Text(error,
              style: TextStyle(color:Colors.black,fontSize:14.0),
           ),

         ],
         ),
       ),
   )
      
    );
  }
    
  }