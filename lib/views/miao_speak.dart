import 'package:flutter/material.dart';

class MiaoSpeak extends StatefulWidget {
  MiaoSpeak({Key key}) : super(key: key);

  @override
  _MiaoSpeakState createState() => _MiaoSpeakState();
}

class _MiaoSpeakState extends State<MiaoSpeak> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Center(
         child: new Text('喵言'),
       ),
    );
  }
}