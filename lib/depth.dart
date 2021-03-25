import 'dart:math';

import 'package:banzhuan/market/huobi/huobi_depth.dart';
import 'package:banzhuan/market/market_depth.dart';
import 'package:banzhuan/market/zb/zb_depth.dart';

class DepthCalcResult {
  /// 如果出现了买不完或者卖不完的情况，finish为false
  bool finish = false;
  double amount = 0;
  List<DepthItem> items = [];
}

class DepthItem {
  double price;
  double amount;

  DepthItem(this.price, this.amount);

  factory DepthItem.fromList(List<String> list) {
    return DepthItem(double.parse(list[0]), double.parse(list[1]));
  }

  factory DepthItem.fromListDouble(List<double> list) {
    return DepthItem(list[0], list[1]);
  }

  double sum() {
    return this.amount * this.price;
  }

}

class Depth {
  // 卖1
  List<DepthItem> asks;

  // 买一
  List<DepthItem> bids;

  // be set
  int setTime = 0;

  Depth(this.asks, this.bids);

  DepthCalcResult canBuy({double money}) {
    DepthCalcResult rst = DepthCalcResult();
    for (var i = 0; i < asks.length; i++) {
      if (money <= 0) break;
      DepthItem ask = asks[i];
      var maxAmount = money / ask.price;
      var amount = min(maxAmount, ask.amount);
      var usedMoney = amount * ask.price;
      money -= usedMoney;
      rst.amount += amount;
      rst.items.add(DepthItem(ask.price, amount));
    }

    rst.finish = money == 0;
    return rst;
  }

  DepthCalcResult canSell({double amount}) {
    DepthCalcResult rst = DepthCalcResult();
    for (var i = 0; i < bids.length; i++) {
      if (amount > 0) {
        DepthItem bid = bids[i];

        var itemAmount = min(amount, bid.amount);
        rst.amount += itemAmount * bid.price;
        rst.items.add(DepthItem(bid.price, itemAmount));
        amount -= itemAmount;
      }
    }

    rst.finish = amount == 0;
    return rst;
  }

  factory Depth.fromDepthNet(MarketDepthNet depthNet) {
    return Depth(depthNet.asks.map((e) => DepthItem.fromList(e)).toList(),
        depthNet.bids.map((e) => DepthItem.fromList(e)).toList());
  }

  factory Depth.fromHuobiDepth(HuobiDepthTick tick) {
    return Depth(tick.asks.map((e) => DepthItem.fromListDouble(e)).toList(),
        tick.bids.map((e) => DepthItem.fromListDouble(e)).toList());
  }

  factory Depth.fromZbDepth(ZbDepth tick) {
    return Depth(tick.asks.map((e) => DepthItem.fromListDouble(e)).toList(),
        tick.bids.map((e) => DepthItem.fromListDouble(e)).toList());
  }
}
