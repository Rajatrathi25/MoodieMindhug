import 'package:flutter/material.dart';
import 'package:mindhug/Resources/Loginbox.dart';
import 'package:mindhug/Screens/Loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindhug/Screens/Mainscreen.dart';


class registerscreenstl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return registerscreen();
  }
}




class registerscreen extends StatefulWidget {
  @override
  _registerscreenState createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String username;
  String pass;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF070610), Color(0xFF070610)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),),
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 70,width: 300,),
                      Text("Create",style: TextStyle(fontSize:60,fontWeight: FontWeight.w800,color: Colors.white),),
                      Text("an Account",style: TextStyle(fontSize:60,fontWeight: FontWeight.w800,color: Colors.white),),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 80,),
                          MaterialButton(
                              onPressed: (){},
                              child: Image.asset('images/fb.png',width: 60,height: 60,)),
                          SizedBox(width: 20,),
                          MaterialButton(
                              onPressed:(){} ,
                              child: Image.asset('images/google.png',width: 60,height: 60,)),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 160,),
                          Text("OR",style: TextStyle(fontSize:20,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Loginbox(
                        hint: "Create your username",
                        onchanged: (value){
                          username=value;
                        },
                        tof: false,
                      ),
                      SizedBox(height: 30,),
                      Loginbox(
                        hint: "Enter you email",
                        onchanged: (value){
                          email=value;
                        },
                        tof: false,
                      ),
                      SizedBox(height: 20,),
                      Loginbox(
                        hint: "Enter Your Password",
                        onchanged: (value){
                          pass=value;
                        },
                        tof: true,
                      ),
                      SizedBox(height: 70,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 0, 0, 20),
                        child: Container(
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: FlatButton(
                            onPressed: () async{
                              try{
                                final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: pass, );
                                if(newuser!=null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mainscreen()));
                                }
                              }
                              catch(e){
                                print(e);
                              }
                              },
                            child: Text("Register",style: (TextStyle(fontSize: 20,color: Colors.black)),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

