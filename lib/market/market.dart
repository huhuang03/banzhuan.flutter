import 'package:banzhuan/coin.dart';
import 'package:banzhuan/config.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/symbol.dart';

abstract class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols = [];
  List<Coin> coins = [];
  Map<Symbol, Depth> depths = {};

  Market(this.name);

  Coin findCoin(Coin coin) {
    var find = coins.firstWhere((element) => element == coin, orElse: () => null);
    if (find == null) {
      throw UnsupportedError("在${this.name}里找不到${coin.name}");
    }
    return find;
  }

  bool canDeposit(Coin coin) {
    print("canDeposit: ${coin.name}");
    return findCoin(coin)?.canDeposit ?? false;
  }

  bool canWithDraw(Coin coin) {
    print("canWithDraw: ${coin.name}");
    return findCoin(coin)?.canWithDraw ?? false;
  }

  Future<List<Symbol>> refreshSymbols();

  Future<Depth> refreshDepthInner(Symbol symbol);

  bool hasDepth(Symbol symbol) {
    var depth = depths.containsKey(symbol)? depths[symbol]: null;
    return depth != null && (DateTime.now().millisecondsSinceEpoch - depth.setTime) < DEPTH_CACHE_TIME;
  }

  Future<Depth> refreshDepth(Symbol symbol, {bool cache = true}) {
    if (cache && hasDepth(symbol)) {
      return Future.value(depths[symbol]);
    }

    return refreshDepthInner(symbol)
        .then((value) {
          depths[symbol] = value;
          return value;
        }).catchError((onError) => depths.remove(symbol));
  }

  String nickname() {
    return name;
  }
}