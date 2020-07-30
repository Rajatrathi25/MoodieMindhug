import 'package:flutter/material.dart';

class textMydiary extends StatelessWidget {
  textMydiary({this.text,this.date,this.mood}) ;

  final String text;
  final String mood;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Text(date,style: TextStyle(fontSize: 18,color: Colors.black54),),
              SizedBox(width: 10,),
              Text(mood,style: TextStyle(fontSize: 18,color: Colors.blue),),

            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFEAB8),
                  border: Border.all(
                    color: Color(0xFFFFFEAB8),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,style: TextStyle(fontSize: 15,color: Colors.black),),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
