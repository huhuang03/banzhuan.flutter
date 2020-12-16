import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/bian/api_bian.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/symbol.dart';

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

      for (var s in this.symbols) {
        if (!this.coins.contains(s.baseCoin)) {
          this.coins.add(s.baseCoin
            ..canDeposit = true
            ..canWithDraw = true);
          this.coins.add(s.quoteCoin
            ..canWithDraw = true
            ..canDeposit = true);
        }
      }
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