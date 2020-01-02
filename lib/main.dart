import 'package:flutter/material.dart';
import 'package:miao_island_flutter/common/app_color.dart';
import 'package:miao_island_flutter/views/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '喵岛',
      theme: ThemeData(
        primaryColor: AppColor.orange,
      ),
      home: new App(),
    );
  }
}
