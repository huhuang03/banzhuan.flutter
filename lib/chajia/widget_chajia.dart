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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.chajia.items.length,
      itemBuilder: (_, index) => WidgetChajiaItem(widget.chajia.items[index]));
  }

  @override
  Widget build(BuildContext context) {
    return buildChajiaItem(context);
  }
}
