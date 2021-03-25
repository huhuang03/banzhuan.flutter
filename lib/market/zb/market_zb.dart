import 'dart:convert';

import 'package:banzhuan/coin.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/market.dart';
import 'package:banzhuan/market/zb/api_zb.dart';
import 'package:banzhuan/symbol.dart';

class MarketZb extends Market {
  MarketZb() : super("zb");

  @override
  Future<Depth> refreshDepthInner(Symbol symbol) {
    return apiZb.depth(symbol.symbol).then((value) => Depth.fromZbDepth(value));
  }

  @override
  Future<List<Symbol>> refreshSymbols() {
    return apiZb.markets().then((value) => jsonDecode(value) as Map<String, dynamic>).then((value) {
      value.forEach((key, value) {
        var split = key.split("_");
        var base = split[0];
        var quote = split[1];
        var symbol = Symbol(Coin.canWidthDrawAndDeposit(base), Coin.canWidthDrawAndDeposit(quote), key);
        this.symbols.add(symbol);
      });
      initCoinsBySymbol();
      return this.symbols;
    });
  }

}