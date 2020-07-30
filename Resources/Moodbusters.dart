import 'package:flutter/material.dart';

class Moodbusters extends StatelessWidget {

  Moodbusters({this.colorf,this.colors,this.text});

  final int colorf;
  final int colors;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(colorf), Color(colors)],
            begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.clamp),
        border: Border.all(color: Color(colorf),
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0,3),
          ),],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Text(text,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
