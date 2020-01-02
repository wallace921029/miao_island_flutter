import 'package:flutter/material.dart';

import 'miao_island.dart';
import 'miao_speak.dart';
import 'my.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  var _views = <Widget>[];

  @override
  void initState() {
    _views.addAll([new MiaoIsland(), new MiaoSpeak(), new My()]);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: _views[_currentIndex],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('喵岛')),
          new BottomNavigationBarItem(icon: new Icon(Icons.local_activity), title: new Text('喵言')),
          new BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text('我的')),
        ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}