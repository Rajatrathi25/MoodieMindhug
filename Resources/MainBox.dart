import 'package:flutter/material.dart';

class MainBox extends StatelessWidget {

  MainBox({this.colorf,this.colors,this.text,this.iconname});

  final int colorf;
  final int colors;
  final String text;
  final IconData iconname;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 110,
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
            Icon(iconname,size: 40,color: Colors.white,),
            SizedBox(height: 10,),
            Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
