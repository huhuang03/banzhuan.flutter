import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/market/okex/api_okex.dart';
import 'package:banzhuan/base/symbol.dart';

class MarketOkex extends Market {
  MarketOkex() : super("Okex");

  @override
  Future<Depth> refreshDepthInner(Symbol symbol) {
    return okexApi.book(symbol.symbol).then((value) => Depth.fromDepthNet(value));
  }

  @override
  Future<List<Symbol>> refreshSymbols() {
    return okexApi.instruments().then((value) {
      return value.map((e) => Symbol.fromOkex(e)).toList();
    }).then((value) {
      this.symbols = value;
      initCoinsBySymbol();
      return this.symbols;
    });
  }

}