import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/huobi/api_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/base/symbol.dart';

class MarketHuobi extends Market {
  MarketHuobi() : super("huobi");

  /// Where are should I cached the package??
  @override
  Future<List<Symbol>> requestSymbols() {
    return houbiApi.currencies().then((value) => value.data)
        .then((value) => value.map((e) => e.getChains()).toList())
        .then((value) => value.map((e) => e.map((e) => e.toCoin()).toList()).toList())
        .then((value) => value.expand((element) => element).toList())
        // .then((value) => this.coins = value..addAll(huobiCurrenciesFix))
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
      return Depth.fromHuobiDepth(huobiDepth.tick);
    });
  }

}