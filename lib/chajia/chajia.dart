import 'package:banzhuan/symbol.dart';

import '../market/market.dart';

class Chajia {
  Market fromMarket;
  Market toMarket;
  ChajiaRefreshCallback callback;

  List<ChajiaItem> items = [];

  Chajia(this.fromMarket, this.toMarket);

  Future<List<ChajiaItem>> refreshDepth(List<ChajiaItem> items) async {
    for (var item in items) {
      await this.fromMarket.refreshDepth(item.fromSymbol);
      await this.toMarket.refreshDepth(item.toSymbol);
      item.calcChajia();
      this.callback?.onDepthGet(this, item);
    }
    return items;
  }


  List<ChajiaItem> getItemsBySameSymbol() {
    List<ChajiaItem> sameSymbols = List();
    this.fromMarket.symbols.forEach((fromSymbol) {
      if (fromSymbol.isBtc) {
        this.toMarket.symbols.forEach((toSymbol) {
          if (fromSymbol == toSymbol) {
            sameSymbols.add(ChajiaItem(fromMarket, toMarket, fromSymbol, toSymbol));
          }
        });
      }
    });
    return sameSymbols;
  }

  Future<Chajia> refresh({ChajiaRefreshCallback callback}) {
    this.callback = callback;
    return fromMarket.refreshSymbols()
        .then((value) {
          print('from Market ${fromMarket.name} symbols length: ${fromMarket.symbols.length}');
          print('from market ${fromMarket.name} symbols: ${fromMarket.symbols}');
          callback.onFromMarketSymbolGet(fromMarket.symbols);
          return toMarket.refreshSymbols();
        })
        .then((value) {
          print('to Market ${toMarket.name} symbols length: ${toMarket.symbols.length}');
          print('to market ${toMarket.name} symbols: ${toMarket.symbols}');
          callback.onToMarketSymbolGet(toMarket.symbols);
          return getItemsBySameSymbol();
        })
        .then((items) {
          print("sameSymbols length: ${items.length}");
          callback?.onSameSymbolGet(items);
          this.items = items;
          return refreshDepth(items);
        })
        .then((chajiaSymbols) {
          for (var chajiaSymbol in chajiaSymbols) {
            if (chajiaSymbol.hasDepth()) {
              var buys = chajiaSymbol.fromSymbol.depth.canBuy(money: 1).amount;
              var sells = chajiaSymbol.toSymbol.depth.canSell(amount: buys);
              print("sells: ${sells.amount}");
            }
          }
          return null;
        })
        .then((value) => this);
  }
}

class ChajiaRefreshCallback {
  final Function(List<Symbol>) onFromMarketSymbolGet;
  final Function(List<Symbol>) onToMarketSymbolGet;
  final Function(List<ChajiaItem>) onSameSymbolGet;
  final Function(Chajia chajia, ChajiaItem item) onDepthGet;
  final Function(List<ChajiaItem>) onAllDepthGet;

  ChajiaRefreshCallback({this.onFromMarketSymbolGet, this.onToMarketSymbolGet, this.onSameSymbolGet, this.onDepthGet, this.onAllDepthGet});
}


class ChajiaItem {
  Symbol fromSymbol;
  Symbol toSymbol;
  Market fromMarket;
  Market toMarket;
  double chajia = -10000;

  ChajiaItem(this.fromMarket, this.toMarket, this.fromSymbol, this.toSymbol);

  bool hasDepth() {
    return this.fromSymbol.depth != null && this.toSymbol.depth != null;
  }

  void calcChajia() {
    if (this.hasDepth()) {
      var money = 0.1;
      var buys = fromSymbol.depth.canBuy(money: money).amount;
      print("can buy: $buys");
      var sells = toSymbol.depth.canSell(amount: buys);
      this.chajia = sells.amount - money;
      print("sells: ${sells.amount}");
    }
  }

}