import 'package:banzhuan/market/bian/market_bian.dart';
import 'package:banzhuan/market/huobi/market_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/market/okex/market_okex.dart';
import 'package:banzhuan/market/zb/market_zb.dart';

/// what can yout do??
class MarketManager {
  final Market bian = MarketBian();
  final Market huobi = MarketHuobi();
  final Market okex = MarketOkex();
  final Market zb = MarketZb();

  var markets = [];

  MarketManager() {
    markets.add(bian);
    markets.add(huobi);
    markets.add(okex);
    markets.add(zb);
  }

}