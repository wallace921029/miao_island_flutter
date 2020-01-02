import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:miao_island_flutter/app_evnet_bus/app_event_bus.dart';
import 'package:miao_island_flutter/app_evnet_bus/tag_event.dart';
import 'package:miao_island_flutter/common/app_color.dart';

class Tag extends StatefulWidget {
  final String text;
  bool defaultActive = false;
  final Function handler;

  Tag({Key key, this.text, this.defaultActive, this.handler}) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  EventBus eventBus = appEventBus;
  bool isActive;

  @override
  void initState() {
    isActive = widget.defaultActive;

    eventBus.on<TagEvent>().listen((TagEvent event) {
      handlerTagEvent(event);
    });
    super.initState();
  }

  handlerTagEvent(TagEvent event) {
    if (event.text == '全部' && !event.activeStatus && widget.text == '全部') {
      setState(() {
        isActive = event.activeStatus;
      });
    }
    if (event.text == '全部' && event.activeStatus && widget.text == '全部') {
      setState(() {
        isActive = event.activeStatus;
      });
    }
    if (event.text == '全部品种') {
      if (widget.text != '全部') {
        setState(() {
          isActive = false;
      });
      }
    }
  }

  initActiveState() {
    setState(() {
      isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Container(
        padding: new EdgeInsets.only(left: 4.0, right: 4.0),
        margin: new EdgeInsets.only(left: 4.0, right: 4.0),
        child: new Text(widget.text,
            style: new TextStyle(color: isActive ? Colors.white : Colors.grey)),
        decoration: new BoxDecoration(
          color: isActive ? AppColor.orange : null,
          borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
        ),
      ),
      onTap: widget.text == '全部' && isActive
          ? null
          : () {
              setState(() {
                isActive = !isActive;
                widget.handler(widget.text, isActive);
              });
            },
    );
  }
}
