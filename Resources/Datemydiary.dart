import 'package:flutter/material.dart';

class Datemydiary extends StatelessWidget {
  Datemydiary({this.date,this.mood});

  final String date;
  final String mood;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10,),
        Text(date,style: TextStyle(fontSize: 18,color: Colors.black54),),
        SizedBox(width: 10,),
        Text(mood,style: TextStyle(fontSize: 18,color: Colors.black54),),

      ],
    );
  }
}