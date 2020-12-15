import 'package:banzhuan/coin.dart';
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
  List<HuobiChain> chains;

  HuobiCurrency(this.chains);

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
    return Coin(chain)
    ..canDeposit = canDeposit
    ..canDeposit = canWithdraw;
  }

  bool get canDeposit => depositStatus == ALLOWED;
  bool get canWithdraw => withdrawStatus == ALLOWED;

  factory HuobiChain.fromJson(Map<String, dynamic> json) => _$HuobiChainFromJson(json);
  Map<String, dynamic> toJson() => _$HuobiChainToJson(this);
}