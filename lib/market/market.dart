import 'package:banzhuan/coin.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/symbol.dart';

abstract class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols = [];
  List<Coin> coins = [];

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

  Future<Depth> refreshDepth(Symbol symbol, {bool cache = true}) {
    if (cache && symbol.isDepthValidate()) {
      return Future.value(symbol.depth);
    }
    return refreshDepthInner(symbol)
        .then((value) {
          symbol.setDepth(value);
          return value;
        }).catchError((onError) => symbol.setDepth(null));
  }

  String nickname() {
    return name;
  }
}