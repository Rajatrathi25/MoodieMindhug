import 'package:flutter/material.dart';

class Moodselectorbox extends StatelessWidget {

  Moodselectorbox({this.icon,this.colors,this.text,this.fontcolor});

  final String icon;
  final int colors;
  final String text;
  final int fontcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Color(colors),
        border: Border.all(color: Color(colors),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(icon),
            Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Color(fontcolor)),)
          ],
        ),
      ),
    );
  }
}
