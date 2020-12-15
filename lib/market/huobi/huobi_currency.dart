import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HuobiCurrencyNet {
  int code;
}

class HuobiCurrency {

}

class HuobiChain {
  String chain;
  String depositStatus;
  String withdrawStatus;
}