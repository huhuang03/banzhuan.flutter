import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/huobi/api_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/symbol.dart';

class MarketHuobi extends Market {
  MarketHuobi() : super("huobi");

  @override
  Future<List<Symbol>> refreshSymbols() {
    return houbiApi.currencies().then((value) => value.data)
        .then((value) => value.map((e) => e.chains).toList())
    // List<List<Chain>>
        .then((value) => value.map((e) => e.map((e) => e.toCoin()).toList()).toList())
        .then((value) => value.expand((element) => element).toList())
    // List<List<Coin>>
        .then((value) => this.coins = value)
        .then((value) => houbiApi.symbols())
        .then((value) => value.data)
        .then((symbols) =>
            symbols
                .where((s) => s.isOnline)
                .map((s) => Symbol.fromHuobi(s))
                .toList())
        .then((symbols) {
          this.symbols = symbols;
          return symbols;
        });
  }

  @override
  Future<Depth> refreshDepthInner(Symbol symbol) {
    return houbiApi.depth(symbol.symbol).then((huobiDepth) {
      symbol.depth = Depth.fromHuobiDepth(huobiDepth.tick);
      return symbol.depth;
    });
  }

}