import 'package:flutter/material.dart';

class Loginbox extends StatelessWidget {

  Loginbox({this.hint,this.onchanged,this.tof});

  final String hint;
  final Function onchanged;
  final bool tof;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,10.0,0,8),
        child: TextField(
          onChanged: onchanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:hint,
          ),
          obscureText: tof,
        ),
      ),
    );
  }
}