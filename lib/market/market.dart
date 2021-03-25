import 'package:banzhuan/base/coin.dart';
import 'package:banzhuan/config.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/base/symbol.dart';

abstract class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols = [];
  List<Coin> coins = [];
  Map<Symbol, Depth> depths = {};

  Market(this.name);

  Coin findCoin(Coin coin) {
    var find =
        coins.firstWhere((element) => element == coin, orElse: () => null);
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

  /// Actual refresh the symbol and colin?
  /// What is a refresh??
  /// Do you think it should go here??
  /// Or some where else? Like a data source?
  /// Forgive me, let just put it here fow now
  Future<List<Symbol>> refreshSymbols({force = false});

  Future<Depth> refreshDepthInner(Symbol symbol);

  bool hasCleanDepth(Symbol symbol) {
    var depth = depths.containsKey(symbol) ? depths[symbol] : null;
    return depth != null &&
        (DateTime.now().millisecondsSinceEpoch - depth.setTime) <
            DEPTH_CACHE_TIME;
  }

  bool hasDepth(Symbol symbol) {
    var depth = depths.containsKey(symbol) ? depths[symbol] : null;
    return depth != null;
  }

  Depth getDepth(Symbol symbol) {
    var depth = depths.containsKey(symbol) ? depths[symbol] : null;
    return depth;
  }

  Future<Depth> refreshDepth(Symbol symbol, {bool cache = true}) {
    if (cache && hasCleanDepth(symbol)) {
      return Future.value(depths[symbol]);
    }

    return refreshDepthInner(symbol).then((value) {
      depths[symbol] = value;
      return value;
    }).catchError((onError) => depths.remove(symbol));
  }

  void initCoinsBySymbol() {
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
  }

  String nickname() {
    return name;
  }
}
