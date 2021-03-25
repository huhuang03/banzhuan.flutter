import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/chajia/chajia_calculator.dart';
import 'package:banzhuan/chajia/widget_chajia.dart';
import 'package:banzhuan/chajia/widget_chajia_calculator.dart';
import 'package:banzhuan/market/bian/market_bian.dart';
import 'package:banzhuan/market/huobi/market_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/market/okex/market_okex.dart';
import 'package:banzhuan/market/zb/market_zb.dart';
import 'package:banzhuan/page/setting/page_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Market bian = MarketBian();
  final Market huobi = MarketHuobi();
  final Market okex = MarketOkex();
  final Market zb = MarketZb();

  ChajiaCalculator chajia1;
  WidgetChajiaCalculatorController chajia1Controller = WidgetChajiaCalculatorController();

  ChajiaCalculator chajia2;
  WidgetChajiaCalculatorController chajia2Controller = WidgetChajiaCalculatorController();

  String stateText = 'IDLE';
  Color stateColor;

  _MyHomePageState() {
    chajia2 = ChajiaCalculator(okex, bian);
    chajia1 = ChajiaCalculator(bian, okex);
  }

  void _refresh() {
    chajia1Controller.refresh()
        .then((value) => chajia2Controller.refresh());
  }

  Widget buildChajiaCalculator(BuildContext context, ChajiaCalculator chajiaCalculator) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetChajiaCalculator(chajia1, chajia1Controller),
        WidgetChajiaCalculator(chajia2, chajia2Controller),
      ],
    );
  }

  Widget buildChajiaView(BuildContext context, Chajia chajia) {
    if (chajia != null) {
      return WidgetChajia(chajia);
    } else {
      return Text("没有计算到差价");
    }
  }

  void setStateText(String text, {bool isError = false}) {
    setState(() {
      this.stateText = stateText;
      if (isError) {
        stateColor = Colors.red;
      } else {
        stateColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Main Page'),
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                // Go Setting Page
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => PageSettings()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                buildChajiaCalculator(context, chajia1),
              ],
            ),
          ),
          Text(
            this.stateText,
            style: TextStyle(
              color: this.stateColor,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

