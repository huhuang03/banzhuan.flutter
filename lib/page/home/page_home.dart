import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/chajia/chajia_calculator.dart';
import 'package:banzhuan/chajia/widget_chajia.dart';
import 'package:banzhuan/market/bian/market_bian.dart';
import 'package:banzhuan/market/huobi/market_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/page/setting/page_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:thyi/thyi.dart';

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
  ChajiaCalculator chajiaHuobiToBian;
  String chajiaStateText = "未获取";
  String stateText = 'IDLE';
  Color stateColor;
  Chajia chajia;

  _MyHomePageState() {
    huobi.name = "huobi";
    chajiaHuobiToBian = ChajiaCalculator(bian, huobi);
  }

  void _refresh() {
    chajiaHuobiToBian.refresh(callback: ChajiaRefreshCallback(
      onFromMarketSymbolGet: (fromSymbols) {
        setState(() {
          this.chajiaStateText = "From ${chajiaHuobiToBian.fromMarket.name} symbols: ${fromSymbols.length}";
        });
      },
      onToMarketSymbolGet: (toSymbols) {
        setState(() {
          this.chajiaStateText = "To ${chajiaHuobiToBian.toMarket.name} symbols: ${toSymbols.length}";
        });
      },
      onSameSymbolGet: (chajiaItems) {
        setState(() {
          this.chajiaStateText = "总共${chajiaItems.length}个相同symbol";
        });
      },
      onDepthGet: (chajia, item) {
        setState(() {
          this.chajiaStateText = "${item.fromSymbol.symbol} depth get";
          this.chajia = chajia;
        });
      }
    )).then((chajia) {
      setState(() {
        if (this.chajia == null) {
          this.chajia = chajia;
        }
      });
    }).catchError((err) {
      print(err);
      setStateText(err.toString());
    });
  }

  Widget buildChajiaCalculator(BuildContext context, ChajiaCalculator chajiaCalculator) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("差价计算，从 ${chajiaCalculator.fromMarket.name} 到 ${chajiaCalculator.toMarket.name}",
          style: TextStyle(fontSize: 25),),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text(chajiaStateText, style: TextStyle(fontSize: 15, backgroundColor: Colors.grey))),
            ),
          ],
        ),
        buildChajiaView(context)
      ],
    );
  }

  Widget buildChajiaView(BuildContext context) {
    if (this.chajia != null) {
      return WidgetChajia(this.chajia);
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
                buildChajiaCalculator(context, chajiaHuobiToBian),
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

