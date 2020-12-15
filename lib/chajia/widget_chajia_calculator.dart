import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/chajia/chajia_calculator.dart';
import 'package:banzhuan/chajia/widget_chajia.dart';
import 'package:flutter/material.dart';

/**
 *
    Future refresh() {
    return calculator
    .refresh(
    callback:
    ChajiaRefreshCallback(onFromMarketSymbolGet: (fromSymbols) {
    setState(() {
    this.chajiaStateText =
    "From ${chajia.fromMarket.name} symbols: ${fromSymbols.length}";
    });
    }, onToMarketSymbolGet: (toSymbols) {
    setState(() {
    this.chajiaStateText =
    "To ${chajia.toMarket.name} symbols: ${toSymbols.length}";
    });
    }, onSameSymbolGet: (chajiaItems) {
    setState(() {
    this.chajiaStateText = "总共${chajiaItems.length}个相同symbol";
    });
    }, onDepthGet: (chajia, item) {
    setState(() {
    this.chajiaStateText = "${item.fromSymbol.symbol} depth get";
    this.chajia = chajia;
    });
    }))
    .then((chajia) {
    setState(() {
    if (this.chajia == null) {
    this.chajia = chajia;
    }
    });
    });
    // return this.state?.refresh();
    }
 */

@immutable
class ChajiaCalculatorValue {
  final Chajia chajia;
  final String calcStateDesc;

  const ChajiaCalculatorValue({this.chajia, this.calcStateDesc});

  ChajiaCalculatorValue copyWith({Chajia chajia, String calcStateDesc}) {
    return ChajiaCalculatorValue(
        chajia: chajia ?? this.chajia,
        calcStateDesc: calcStateDesc ?? this.calcStateDesc);
  }
}

class WidgetChajiaCalculatorController
    extends ValueNotifier<ChajiaCalculatorValue> {
  WidgetChajiaCalculatorController({ChajiaCalculatorValue value})
      : super(value == null
            ? ChajiaCalculatorValue(calcStateDesc: "Idle")
            : value);
  ChajiaCalculator calculator;

  Future refresh() {
    return calculator
        .refresh(
            callback:
                ChajiaRefreshCallback(onFromMarketSymbolGet: (fromSymbols) {
      value = value.copyWith(
          calcStateDesc:
              "From ${calculator.fromMarket.name} symbols: ${fromSymbols.length}");
    }, onToMarketSymbolGet: (toSymbols) {
      value = value.copyWith(
          calcStateDesc:
              "To ${calculator.toMarket.name} symbols: ${toSymbols.length}");
    }, onSameSymbolGet: (chajiaItems) {
      value = value.copyWith(calcStateDesc: "总共${chajiaItems.length}个相同symbol");
    }, onDepthGet: (chajia, item) {
      value = value.copyWith(
          calcStateDesc: "${item.fromSymbol.symbol} depth get", chajia: chajia);
    }))
        .then((chajia) {
      value = value.copyWith(chajia: chajia);
    });
    // return this.state?.refresh();
  }
}

class WidgetChajiaCalculator extends StatefulWidget {
  final ChajiaCalculator calculator;
  final WidgetChajiaCalculatorController controller;

  WidgetChajiaCalculator(this.calculator, this.controller) {
    this.controller.calculator = calculator;
  }

  @override
  _WidgetChajiaCalculatorState createState() => _WidgetChajiaCalculatorState();
}

class _WidgetChajiaCalculatorState extends State<WidgetChajiaCalculator> {
  ChajiaCalculatorValue get value => widget.controller.value;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "差价计算: ${widget.calculator.fromMarket.name} -> ${widget.calculator.toMarket.name}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                      child: Text(value.calcStateDesc,
                          style: TextStyle(
                              fontSize: 15, backgroundColor: Colors.grey))),
                ),
              ],
            ),
            value.chajia != null ? WidgetChajia(value.chajia) : Text("未计算到差价")
          ],
        );
      },
    );
  }
}
