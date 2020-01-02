import 'package:flutter/material.dart';

class MiaoIslandCard extends StatefulWidget {
  MiaoIslandCard({Key key}) : super(key: key);

  @override
  _MiaoIslandCardState createState() => _MiaoIslandCardState();
}

class _MiaoIslandCardState extends State<MiaoIslandCard> {
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 24) / 2;
    return Container(
      width: width,
      padding: new EdgeInsets.all(8.0),
      decoration: new BoxDecoration(color: Colors.white),
      child: new Column(children: <Widget>[
        new AspectRatio(
          aspectRatio: 1,
          child: new Image.network(
              'https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2247692397,1189743173&fm=5R',
              fit: BoxFit.fill),
        ),
        new Padding(
          padding: new EdgeInsets.only(top: 8, bottom: 8),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Text('美国短毛猫', style: new TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
              ),
              new Container(
                height: 27,
                child: new IconButton(
                  icon: new Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 20,
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.all(0),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        new Padding(
          padding: new EdgeInsets.only(bottom: 8),
          child: new Row(
            children: <Widget>[
              new InnerTag(text: '公猫', style: 'blue'),
              new InnerTag(text: '3个月', style: 'purple'),
            ],
          ),
        ),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Text('¥1299', style: new TextStyle(
                color: Colors.red,
                fontSize: 18,
                height: 1.5,
              )),
            ),
            new Text('1小时前', style: new TextStyle(
              color: Colors.grey,
              fontSize: 16,
              height: 1.5,
            ))
          ],
        ),
      ]),
    );
  }
}

class InnerTag extends StatelessWidget {
  final String text;
  final String style;

  InnerTag({Key key, this.text, this.style}) : super(key: key);

  final Map<String, dynamic> colorStyle = {
    'blue': {
      'backgroudColor': new Color.fromARGB(255, 206, 214, 230),
      'fontColor': new Color.fromARGB(255, 70, 104, 208),
    },
    'pink': {
      'backgroudColor': new Color.fromARGB(255, 251, 226, 241),
      'fontColor': new Color.fromARGB(255, 250, 117, 155),
    },
    'purple': {
      'backgroudColor': new Color.fromARGB(255, 230, 223, 241),
      'fontColor': new Color.fromARGB(255, 128, 78, 206),
    }
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(left: 8, right: 8),
      margin: new EdgeInsets.only(right: 4),
      decoration: new BoxDecoration(
        color: colorStyle[style]['backgroudColor'],
        borderRadius: new BorderRadius.all(new Radius.circular(3.0))
      ),
      child: new Center(
        child: new Text(text, style: new TextStyle(
          color: colorStyle[style]['fontColor'],
        )),
      ),
    );
  }
}