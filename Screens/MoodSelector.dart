import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindhug/Resources/MainBox.dart';
import 'package:mindhug/Resources/Moodbusters.dart';
import 'package:mindhug/Resources/Moodselectorbox.dart';
import 'package:mindhug/Screens/Mydiary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindhug/Screens/Mainscreen.dart';



class MoodSelectorstl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class MoodSelector extends StatefulWidget {

  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {

  final _firestore = Firestore.instance;
  final _auth= FirebaseAuth.instance;
  FirebaseUser loggedinUser;
  String moodi;
  String diarytext;
  var finaldate=DateTime.now();
  var formateddate;


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


  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
      String val = finaldate.toString();
      var date=DateTime.parse(val);
      formateddate="${date.day}-${date.month}-${date.year}";
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }


  void bottomsheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(
              color: Color(0xFFFFE8F3,),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Write a few words',style: TextStyle(fontSize: 30,color: Color(0xFFA366DB),fontWeight: FontWeight.w500),),
                  Text('in your Diary:',style: TextStyle(fontSize: 30,color: Color(0xFFA366DB),fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Container(
                    height: 250,
                    width: 320,
                    color: Colors.white,
                    child: TextField(
                      onChanged: (value){
                        diarytext=value;
                      },
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      expands:true,),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    width: 420,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFC447),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      gradient: LinearGradient(colors: [Color(0xFFDE81D6), Color(0xFF7D6DD6)],
                          begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),
                    ),
                    child: FlatButton(
                      onPressed: (){
                        _firestore.collection('mood').add({'moodvalue':moodi,'text':diarytext,'date':formateddate,});
                        Navigator.pop(context);
                      },
                      child: Text("Save",style: (TextStyle(fontSize: 30,color: Colors.black)),),
                    ),
                  ),
                ],
              ),
            ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFEAB8),
                    border: Border.all(
                      color: Color(0xFFFFFEAB8),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  padding: EdgeInsets.fromLTRB(100,10,30,10),
                  child: formateddate == null
                      ? Text(
                    "Select the Date",style: (TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                  )
                      : Text(
                    "$formateddate",style: (TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                ),
                new RaisedButton(
                  onPressed: (){
                    callDatePicker();
                  },
                  color: Colors.deepPurpleAccent[200],
                  child:
                  new Text('Change date', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 0, 0),
              child: Container(
                child: Text("How are you feeling ??",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){
                      bottomsheet(context);
                      moodi='happy';
                    },
                    child: Moodselectorbox(icon: 'images/happy.png',fontcolor: 0xFFF0A2C7,colors: 0xFFFFE0EF,text: 'Happy',),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Thinking';},
                    child: Moodselectorbox(icon: 'images/thinking.png',fontcolor: 0xFFFDEB759,colors: 0xFFFFFEAB8,text: 'Thinking',),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Cool';},
                    child: Moodselectorbox(icon: 'images/cool.png',fontcolor: 0xFF6BBDB6,colors: 0xFFCDFAF6,text: 'Cool',),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Angry';},
                    child: Moodselectorbox(icon: 'images/angry.png',fontcolor: 0xFFE68268,colors: 0xFFFFE0EF,text: 'Angry',),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Surprise';},
                    child: Moodselectorbox(icon: 'images/surprise.png',fontcolor: 0xFFAC9AD0,colors: 0xFFF1EAFF,text: 'Surprise',),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Anxious';},
                    child: Moodselectorbox(icon: 'images/anxious.png',fontcolor: 0xFFAFB3EA,colors: 0xFFE9EAFF,text: 'Anxious',),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Sad';},
                    child: Moodselectorbox(icon: 'images/sad.png',fontcolor: 0xFFE58463,colors: 0xFFFCECD0,text: 'Sad'),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Sleepy';},
                    child: Moodselectorbox(icon: 'images/sleepy.png',fontcolor: 0xFFD49AB6,colors: 0xFFFFE8F3,text: 'Sleepy',),
                  ),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: (){bottomsheet(context);moodi='Normal';},
                    child: Moodselectorbox(icon: 'images/Normal.png',fontcolor: 0xFFA366DB,colors: 0xFFEBD9FD,text: 'Normal',),
                  ),
                ],
              ),
            ),
            SizedBox(height: 121,),
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
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>mydiary()));},
                child: Text("Go To Diary",style: (TextStyle(fontSize: 30,color: Colors.black)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
