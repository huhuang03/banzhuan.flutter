import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/bian/api_bian.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/base/symbol.dart';

class MarketBian extends Market {
  MarketBian() : super("bian");

  @override
  Future<List<Symbol>> refreshSymbols() {
    return bianApi.exchangeInfo()
    .then((value) => value.symbols)
    .then((value) => value.where((element) => element.isTrading()).toList())
    .then((value) => value.map((s) => Symbol.fromBian(s)).toList())
    .then((symbols) {
      this.symbols = symbols;
      initCoinsBySymbol();
      return symbols;
    });
  }

  @override
  Future<Depth> refreshDepthInner(Symbol symbol) {
    return bianApi.depth(symbol.symbol).then((bianDepth) {
      return Depth.fromDepthNet(bianDepth);
    });
  }

}