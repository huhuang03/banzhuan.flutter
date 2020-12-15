import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/symbol.dart';
import 'package:flutter/material.dart';

class WidgetChajiaItem extends StatefulWidget {
  final ChajiaItem chajia;

  WidgetChajiaItem(this.chajia);

  @override
  _WidgetChajiaItemState createState() => _WidgetChajiaItemState();
}

class _WidgetChajiaItemState extends State<WidgetChajiaItem> {
  bool isExpand = false;

  bool get hasDepth {
    return this.widget.chajia.hasDepth();
  }

  Symbol get symbol {
    return widget.chajia.fromSymbol;
  }

  Widget buildChajia(BuildContext context) {
    var text = "${widget.chajia.fromSymbol.symbol}";
    if (!hasDepth) {
      text += " depth未获取";
    } else {
      text += " 差价: ${widget.chajia.chajia}";
    }

    return Column(
      children: [
        InkWell(
          child: hasDepth?
              ExpansionTile(
                title: Text("${symbol.symbol}差价：${widget.chajia.chajia}"),
                children: [
                  buildOneChajiaTradeItem(context, widget.chajia.buy, "买"),
                  buildOneChajiaTradeItem(context, widget.chajia.sell, "卖"),
                ],
              )
              : Text("${widget.chajia.fromSymbol.symbol} 未获取"),
          onTap: () {
            setState(() {
              if (hasDepth) {
                this.isExpand = !isExpand;
              }
            });
          },
        ),
      ],
    );
  }

  Widget buildOneChajiaTradeItem(
      BuildContext context, DepthCalcResult result, String prefix) {
    if (result == null) return Container();
    return ListView(
      shrinkWrap: true,
      children: result.items
          .map((e) => Text("$prefix ${e.price}x${e.amount}"))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChajia(context),
      ],
    );
  }
}
