import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/depth.dart';
import 'package:flutter/material.dart';

class WidgetChajiaItem extends StatefulWidget {
  final ChajiaItem chajia;

  WidgetChajiaItem(this.chajia);

  @override
  _WidgetChajiaItemState createState() => _WidgetChajiaItemState();
}

class _WidgetChajiaItemState extends State<WidgetChajiaItem> {
  bool isExpand = false;

  Widget buildChajia(BuildContext context) {
    var text = "${widget.chajia.fromSymbol.symbol}";
    if (!widget.chajia.hasDepth()) {
      text += " depth未获取";
    } else {
      text += " 差价: ${widget.chajia.chajia}";
    }
    return Text(text);
  }

  Widget buildOneChajiaTradeItem(BuildContext context, DepthCalcResult result,
      String prefix) {
    return ListView(
      shrinkWrap: true,
      children: result.items.map((e) => Text("$prefix ${e.price}x${e.amount}")).toList(),
    );
  }

  Widget buildChajiaTradeItem(BuildContext context) {
    if (widget.chajia.hasDepth() && this.isExpand) {
      return Column(
        children: [
          buildOneChajiaTradeItem(context, widget.chajia.buy, "买"),
          buildOneChajiaTradeItem(context, widget.chajia.sell, "卖"),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildChajia(context),
    ],);
  }
}
