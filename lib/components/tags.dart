import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:miao_island_flutter/app_evnet_bus/app_event_bus.dart';
import 'package:miao_island_flutter/app_evnet_bus/tag_event.dart';
import 'package:miao_island_flutter/components/tag.dart';


class Tags extends StatefulWidget {
  final List<String> category;
  final Function handler;

  Tags({Key key, this.category, this.handler}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Tag> _list  = new List<Tag>();
  List<String> copyCategory = [];
  EventBus eventBus = appEventBus;

  @override
  void initState() {
    initTags();
    super.initState();
  }

  void initTags() {
    widget.category.forEach(((text){
      bool defaultActiveStatus = text == '全部'; 
      _list.add(new Tag(text: text, defaultActive: defaultActiveStatus, handler: tagHandler));
    }));
  }

  void tagHandler(String category, bool isActive) {
    if (category != '全部' && isActive) {
      copyCategory.add(category);
      eventBus.fire(new TagEvent(text: '全部', activeStatus: false));
    }
    if (category != '全部' && !isActive) {
      copyCategory.remove(category);
      if (copyCategory.length == 0) {
        eventBus.fire(new TagEvent(text: '全部', activeStatus: true));
      }
    }
    if (category == '全部') {
      copyCategory = [];
      eventBus.fire(new TagEvent(text: '全部品种', activeStatus: true));
    }
    widget.handler(copyCategory);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 4, right: 4),
      width: double.infinity,
      height: 30,
      child: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _list,
        ),
      ),
    );
  }
}