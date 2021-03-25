import 'package:banzhuan/base/symbol.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/market.dart';
// we want chajia result go here, and don't mess up with http request.

class ChajiaResult {
  List<ChajiaMarket> items;
}

class ChajiaMarket {
  Market fromMarket;
  Market toMarket;

  List<ChajiaSymbol> items = [];

  ChajiaMarket(this.fromMarket, this.toMarket);
}


/// Should you have some state?
class ChajiaSymbol {
  static const int STATE_OK = 0;
  static const int STATE_NO_DEPTH = -1;
  static const int STATE_NO_ENOUGH_BUY = -2;
  static const int STATE_NO_ENOUGH_SELL = -3;

  Symbol fromSymbol;
  Symbol toSymbol;
  int state;

  Market fromMarket;
  Market toMarket;
  // 没有说清楚是不是100%
  double chajia = -10000;

  DepthCalcResult buy;
  DepthCalcResult sell;

  ChajiaSymbol(this.fromMarket, this.toMarket, this.fromSymbol, this.toSymbol) {
    this.state = STATE_NO_DEPTH;
  }

  bool hasDepth() {
    return this.fromMarket.hasDepth(this.fromSymbol) && this.toMarket.hasDepth(this.toSymbol);
  }

  void calcChajia() {
    if (this.hasDepth()) {
      var money = 0.1;
      buy = this.fromMarket.getDepth(this.fromSymbol).canBuy(money: money);
      sell = this.toMarket.getDepth(this.toSymbol).canSell(amount: buy.amount);
      this.chajia = sell.amount - money;
    }
  }

  void _refreshState() {
    if (!this.hasDepth()) {
      this.state = STATE_NO_DEPTH;
    } else {
      if (this.buy != null && !this.buy.finish) {
        this.state = STATE_NO_ENOUGH_BUY;
      } else if (this.sell != null && !this.sell.finish) {
        this.state = STATE_NO_ENOUGH_SELL;
      }
    }
  }

  bool ok() {
    return state == STATE_OK;
  }
}
