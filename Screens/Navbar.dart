import 'package:flutter/material.dart';
import 'package:mindhug/Screens/Mainscreen.dart';
import 'package:mindhug/Screens/MoodSelector.dart';
import 'package:mindhug/Screens/Mydiary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindhug/Screens/Loginscreen.dart';


class NavDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFDE81D6), Color(0xFF7D6DD6)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text("Moodie",style: TextStyle(fontFamily: 'Monoton',fontSize:50),),
              )),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context)=>mainscreen()))},
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('My Diary'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>mydiary()))},
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('My Statistics'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.mood),
            title: Text('Evaluate'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>MoodSelector()))},
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {_auth.signOut(),Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()))},
          ),
        ],
      ),
    );
  }
}
