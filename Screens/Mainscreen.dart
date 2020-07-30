import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindhug/Resources/MainBox.dart';
import 'package:mindhug/Resources/Moodbusters.dart';
import 'package:mindhug/Screens/MoodSelector.dart';
import 'package:mindhug/Screens/Navbar.dart';
import 'Registerscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

String userid;

class mainscreestl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mainscreen();
  }
}


class mainscreen extends StatefulWidget {
  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  final _auth= FirebaseAuth.instance;
  FirebaseUser loggedinUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentuser();
  }
  void getCurrentuser() async{
    final user = await  _auth.currentUser();
    try{
      if(user!=null){
        loggedinUser=user;
        userid=loggedinUser.toString();
        print(loggedinUser.email);
      }
    }
    catch(e){
      print(e);
    }


}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF070610),
      drawer: NavDrawer(),
      appBar: AppBar(
        title:Text('App',style:TextStyle(color:Color(0xFF070610)) ,),
        backgroundColor:Color(0xFF070610),
        elevation: 0,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0,right:0.0,top:10.0 ,bottom:30.0 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.values[0],
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0,right:0.0,top:0.0 ,bottom:0.0 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Hey!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text('Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60.0,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,right:0.0,top:0.0 ,bottom:0.0 ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Text("Positive activities ",style: TextStyle(fontSize: 18,color: Colors.black54),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          MainBox(colorf:0xFFF69E6C9,colors:0xFFF04E3E3 ,text: "Do a Silly Dance",iconname: Icons.accessibility_new,),
                          SizedBox(width: 20,),
                          MainBox(colorf:0xFFFED6692,colors:0xFFFEB5775,text: "Read book",iconname: Icons.book,),
                          SizedBox(width: 20,),
                          MainBox(colorf:0xFFFCC79F2,colors:0xFFF997FF4 ,text: "Take a walk Outside",iconname: Icons.directions_walk,),
                          SizedBox(width: 20,),
                          MainBox(colorf:0xFFF82C6F1,colors:0xFFF7DA2F3 ,text: "House Cleaning",iconname: Icons.home,),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Text("Mood Boosters",style: TextStyle(fontSize: 18,color: Colors.black54),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Moodbusters(colorf:0xFFF3EC69E,colors:0xFFF1E679C ,text: "Chat with friend ",),
                          SizedBox(width: 20,),
                          Moodbusters(colorf:0xFFFFBC57D,colors:0xFFFAA627F,text: "Read Memes",),
                          SizedBox(width: 20,),
                          Moodbusters(colorf:0xFFFA3C868,colors:0xFFFCB542B ,text: "Do Gym",),
                          SizedBox(width: 20,),
                          Moodbusters(colorf:0xFFFD09682,colors:0xFFFFCB76A ,text: "Listen Music",),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 450,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFFFFC447),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        gradient: LinearGradient(colors: [Color(0xFFDE81D6), Color(0xFF7D6DD6)],
                            begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),
                      ),
                      child: FlatButton(
                        onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>MoodSelector()));},
                        child: Text("Evaluate your Mood",style: (TextStyle(fontSize: 30,color: Colors.black)),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}

