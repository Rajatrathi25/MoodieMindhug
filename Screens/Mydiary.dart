import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindhug/Resources/Datemydiary.dart';
import 'package:mindhug/Resources/textMydiary.dart';
import 'package:mindhug/Screens/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = Firestore.instance;
final _auth= FirebaseAuth.instance;
FirebaseUser loggedinUser;

class mydiarystl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mydiary();
  }
}

class mydiary extends StatefulWidget {
  @override
  _mydiaryState createState() => _mydiaryState();
}

class _mydiaryState extends State<mydiary> {

  void datastream() async{
    await for (var snapshot in  _firestore.collection('mood').snapshots()){
      for(var message in snapshot.documents){
        print(message.data);
      }
    }
  }

  void getCurrentuser() async {
    final user = await _auth.currentUser();
    try {
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
      }
    }
    catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getCurrentuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070610),
      drawer: NavDrawer(),
      appBar: AppBar(
        title:Text('App',style:TextStyle(color: Color(0xFF070610)) ,),
        backgroundColor:Color(0xFF070610),
        elevation: 0,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0,right:0.0,top:20.0 ,bottom:30.0 ),
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
                      Text('My',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text('Diary',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70.0,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MessageStream()
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

class MessageStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:_firestore.collection('mood').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<textMydiary> messageBubbles =[];
        for(var message in messages){
            final messageText = message.data['text'];
            print(messageText);
            final messagedate = message.data['date'];
            print(messagedate);
            final messagemood= message.data['moodvalue'];
            print(messagemood);
            final diarytext = textMydiary(text:messageText,date: messagedate,mood: messagemood);
            print(diarytext);
            messageBubbles.add(diarytext);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical:5.0 ,horizontal: 10.0),
            children: messageBubbles,
          ),
        );}
    );
  }
}



