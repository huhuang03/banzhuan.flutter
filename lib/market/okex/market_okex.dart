import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/market/okex/api_okex.dart';
import 'package:banzhuan/symbol.dart';

class MarketOkex extends Market {
  MarketOkex(String name) : super("Okex");

  // TODO how to judge depth??
  @override
  Future<Depth> refreshDepthInner(Symbol symbol) {
    return okexApi.book(symbol.symbol, "20", "0.1").then((value) => Depth.fromDepthNet(value));
  }

  @override
  Future<List<Symbol>> refreshSymbols() {
    return okexApi.instruments.then((value) => value);
  }

}