import 'package:flutter/material.dart';
import 'package:miao_island_flutter/components/miao_island_card.dart';
import 'package:miao_island_flutter/components/tags.dart';

class MiaoIsland extends StatefulWidget {
  MiaoIsland({Key key}) : super(key: key);

  @override
  _MiaoIslandState createState() => _MiaoIslandState();
}

class _MiaoIslandState extends State<MiaoIsland> {
  int sex;
  int sortByPrice;
  int ageArea;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('喵岛'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: new EdgeInsets.only(left: 8, right: 8),
                    child: new DropdownButton(
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(child: new Text('母猫'), value: 0),
                        new DropdownMenuItem(child: new Text('公猫'), value: 1),
                      ], 
                      value: sex,
                      hint: new Text('性别'),
                      onChanged: (value) {
                        setState(() {
                          sex = value;
                        });
                      },
                    ),
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: new EdgeInsets.only(left: 8, right: 8),
                    child: new DropdownButton(
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(child: new Text('价格由低到高'), value: 0),
                        new DropdownMenuItem(child: new Text('价格由高到低'), value: 1),
                      ], 
                      value: sortByPrice,
                      hint: new Text('排序'),
                      onChanged: (value) {
                        setState(() {
                          sortByPrice = value;
                        });
                      },
                    ),
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: new EdgeInsets.only(left: 8, right: 8),
                    child: new DropdownButton(
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(child: new Text('0~3个月'), value: 0),
                        new DropdownMenuItem(child: new Text('3~12个月'), value: 1),
                        new DropdownMenuItem(child: new Text('12~24个月'), value: 2),
                        new DropdownMenuItem(child: new Text('24个月以上'), value: 3),
                      ], 
                      value: ageArea,
                      hint: new Text('年龄'),
                      onChanged: (value) {
                        setState(() {
                          ageArea = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Tags(
            category: ['全部', '美短', '英短', '加菲', '布偶', '暹罗', '折耳', '波斯', '蓝猫', '缅因', '司芬克斯', '狸花'],
            handler: (List<String> list){
              print(list);
            }
          ),
          new Divider(height: 0),
          new Expanded(
            child: new SingleChildScrollView(
              child: new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    new MiaoIslandCard(),
                    new MiaoIslandCard(),
                    new MiaoIslandCard(),
                    new MiaoIslandCard(),
                    new MiaoIslandCard(),
                    new MiaoIslandCard(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}