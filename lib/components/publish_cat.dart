import 'package:flutter/material.dart';

class PublishCat extends StatefulWidget {
  PublishCat({Key key}) : super(key: key);

  @override
  _PublishCatState createState() => _PublishCatState();
}

class _PublishCatState extends State<PublishCat> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发布'),
      ),
      body: new Container(
        margin: new EdgeInsets.only(top: 8, bottom: 8),
        padding: new EdgeInsets.only(left: 8, right: 8),
        color: Colors.white,
        child: new SingleChildScrollView(
          child: new Form(
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Padding(
                      padding: new EdgeInsets.only(right: 8),
                      child: new Text('品种'),
                    ),
                    hintText: '请输入品种',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
