import 'package:flutter/material.dart';
import 'package:mindhug/Resources/Loginbox.dart';
import 'package:mindhug/Screens/Mainscreen.dart';
import 'package:mindhug/Screens/Registerscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Loginscreenstl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

  }

  String email;
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
                  gradient: LinearGradient(colors: [Color(0xFF070610),Color(0xFF070610)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),),
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 70,width: 300,),
                      Text("Welcome ",style: TextStyle(fontSize:60,fontWeight: FontWeight.w800,color: Colors.white),),
                      Text("Back",style: TextStyle(fontSize:60,fontWeight: FontWeight.w800,color: Colors.white),),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 80,),
                          MaterialButton(
                              onPressed: (){},
                              child: Image.asset('images/fb.png',width: 60,height: 60,)),
                          SizedBox(width: 20,),
                          MaterialButton(
                              onPressed:(){
                                try{
                                  signInWithGoogle();
                                  print('sign in');
                                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>mainscreen()));
                                }
                                catch(e){
                                 print(e);
                                }
                              } ,
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
                      Loginbox(hint: "Enter you email",onchanged: (value){email=value;},tof: false,),
                      SizedBox(height: 20,),
                      Loginbox(hint: "Enter Your Password",onchanged: (value){pass=value;},tof: true,),
                      SizedBox(height: 120,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
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
                                final user=await _auth.signInWithEmailAndPassword(email: email, password: pass);
                                if(user!=null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mainscreen()));
                                }
                              }
                              catch(e){
                                print(e);
                              }

                              },
                            child: Text("Login",style: (TextStyle(fontSize: 20,color: Colors.black54)),),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 70,),
                          Text("Does not have an account ?",style: TextStyle(fontSize:16,fontWeight: FontWeight.w700,color: Colors.white),),
                          FlatButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>registerscreen()));},
                              padding: EdgeInsets.all(0),
                              child: Text('Register',style: TextStyle(decoration: TextDecoration.underline,color: Colors.white),))
                        ],
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



