import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/page/home/widget_chajia_item.dart';
import 'package:flutter/material.dart';

class WidgetChajia extends StatefulWidget {
  final Chajia chajia;

  WidgetChajia(this.chajia);

  @override
  _WidgetChajiaState createState() => _WidgetChajiaState();
}

class _WidgetChajiaState extends State<WidgetChajia> {
  static const TAKE_LEN = 5;

  Widget buildChajiaItem(BuildContext context) {
    // sort
    widget.chajia.items.sort((a, b) {
      if (a.chajia > b.chajia) {
        return -1;
      } else if (a.chajia == b.chajia) {
        return 0;
      }
      return 1;
    });
    var items = widget.chajia.items.take(TAKE_LEN).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (_, index) => WidgetChajiaItem(items[index]));
  }

  @override
  Widget build(BuildContext context) {
    return buildChajiaItem(context);
  }
}
