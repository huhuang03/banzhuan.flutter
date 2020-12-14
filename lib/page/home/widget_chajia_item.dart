import 'package:banzhuan/chajia/chajia.dart';
import 'package:flutter/material.dart';

class WidgetChajiaItem extends StatefulWidget {
  final ChajiaItem chajia;

  WidgetChajiaItem(this.chajia);

  @override
  _WidgetChajiaItemState createState() => _WidgetChajiaItemState();
}

class _WidgetChajiaItemState extends State<WidgetChajiaItem> {
  Widget buildChajia(BuildContext context) {
    var text = "${widget.chajia.fromSymbol.symbol}";
    if (!widget.chajia.hasDepth()) {
      text += " depth未获取";
    } else {
      text += " 差价: ${widget.chajia.chajia}";
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildChajia(context),
    ],);
  }
}
