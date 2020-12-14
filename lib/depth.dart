import 'dart:math';

import 'package:banzhuan/depth_item.dart';
import 'package:banzhuan/market/huobi/huobi_depth.dart';
import 'package:banzhuan/market/market_depth.dart';

class DepthCalcResult {
  double amount = 0;
  List<DepthItem> items = [];
}

class Depth {
  // 卖1
  List<DepthItem> asks;

  // 买一
  List<DepthItem> bids;

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

    if (money > 0) {
      throw UnsupportedError("买不完");
    }
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

    if (amount > 0) {
      throw UnsupportedError("卖不完");
    }
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
}
