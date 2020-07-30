import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindhug/Screens/Loginscreen.dart';
import 'package:mindhug/Screens/Mainscreen.dart';

class firstscreenstl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class firstscreen extends StatefulWidget {
  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF070610), Color(0xFF070610)],
            begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp),),

//          decoration: BoxDecoration(0C0D12
//          0xFF47D78B ,0xFF257EA0
//            image: DecorationImage(
//              image: AssetImage('images/girl.png'),
//            )
//          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150,width: 500,),
              Text("Moodie",style: TextStyle(fontFamily: 'Monoton',fontSize:80,color:Colors.white),),
              //Image.asset('images/circle.png',width: 600,height: 400,),
              SizedBox(height: 20,),
              Text("Say hi to your ",style: (TextStyle(fontSize: 40,color: Colors.white,fontFamily: 'Montserrat')),),
              Text(" Mood Diary",style: (TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900)),),
              SizedBox(height: 10,),
              Text("Feel Better , Be Better",style: (TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: FlatButton(
                  onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginscreen()));},
                  child: Text("Let's Get Started",style: (TextStyle(fontSize: 16,color: Colors.black)),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

