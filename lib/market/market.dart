import 'package:banzhuan/coin.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/symbol.dart';

abstract class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols;
  List<Coin> coins;

  Market(this.name);

  Coin findCoin(Coin coin) {
    var find = coins.firstWhere((element) => element == coin);
    if (find == null) {
      throw UnsupportedError("在${this.name}里找不到${coin.name}");
    }
    return find;
  }

  bool canDeposit(Coin coin) {
    return findCoin(coin).canDeposit;
  }

  bool canWithDraw(Coin coin) {
    return findCoin(coin).canWithDraw;
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
        });
  }

  String nickname() {
    return name;
  }
}