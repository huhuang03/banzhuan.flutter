import 'file:///E:/source/banzhuan.flutter/lib/base/coin.dart';
import 'package:json_annotation/json_annotation.dart';

part 'huobi_currency.g.dart';

@JsonSerializable()
class HuobiCurrencyNet {
  int code;
  List<HuobiCurrency> data;

  HuobiCurrencyNet(this.code, this.data);

  factory HuobiCurrencyNet.fromJson(Map<String, dynamic> json) => _$HuobiCurrencyNetFromJson(json);
  Map<String, dynamic> toJson() => _$HuobiCurrencyNetToJson(this);
}

@JsonSerializable()
class HuobiCurrency {
  String currency;

  List<HuobiChain> chains;

  List<HuobiChain> getChains() {
    if (this.chains == null || this.chains.length == 0) {
      return [HuobiChain(currency, "deny", "deny")];
    } else {
      return chains;
    }
  }

  HuobiCurrency(this.currency, this.chains);

  factory HuobiCurrency.fromJson(Map<String, dynamic> json) => _$HuobiCurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$HuobiCurrencyToJson(this);
}

@JsonSerializable()
class HuobiChain {
  static const ALLOWED = "allowed";
  String chain;
  String depositStatus;
  String withdrawStatus;

  HuobiChain(this.chain, this.depositStatus, this.withdrawStatus);

  Coin toCoin() {
    var name = chain;
    if (chain.endsWith("1")) {
      name = chain.substring(0, chain.length - 1);
    }
    return Coin(name)
    ..canDeposit = canDeposit
    ..canWithDraw = canWithdraw;
  }

  bool get canDeposit => depositStatus == ALLOWED;
  bool get canWithdraw => withdrawStatus == ALLOWED;

  factory HuobiChain.fromJson(Map<String, dynamic> json) => _$HuobiChainFromJson(json);
  Map<String, dynamic> toJson() => _$HuobiChainToJson(this);
}