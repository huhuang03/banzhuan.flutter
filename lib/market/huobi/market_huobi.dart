import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/huobi/api_huobi.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/symbol.dart';

class MarketHuobi extends Market {
  MarketHuobi() : super("huobi");

  @override
  Future<List<Symbol>> refreshSymbols() {
    return houbiApi.symbols()
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