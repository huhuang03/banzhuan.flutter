import 'package:json_annotation/json_annotation.dart';

part 'huobi_symbol.g.dart';

@JsonSerializable()
class HuobiSymbolNet {
  List<HuobiSymbol> data;

  HuobiSymbolNet(this.data);

  factory HuobiSymbolNet.fromJson(Map<String, dynamic> json) => _$HuobiSymbolNetFromJson(json);

  Map<String, dynamic> toJson() => _$HuobiSymbolNetToJson(this);

}

/*
 *  {
 *      "base-currency": "btc",
 *      "quote-currency": "usdt",
 *      "price-precision": 2,
 *      "amount-precision": 4,
 *      "symbol-partition": "main",
 *      "symbol": "btcusdt"
 *  }
 */
@JsonSerializable()
class HuobiSymbol {
  static const String STATE_ONLINE = "online";

  // the 1
  @JsonKey(name: 'base-currency')
  String baseCurrency;
  // the n
  @JsonKey(name: 'quote-currency')
  String quoteCurrency;

  @JsonKey(name: 'price-precision')
  int pricePrecision;

  @JsonKey(name: 'amount-precision')
  int amountPrecision;

  String state;

  String symbol;

  HuobiSymbol(this.baseCurrency, this.quoteCurrency, this.pricePrecision,
      this.amountPrecision, this.state, this.symbol);

  bool get isOnline {
    return state == STATE_ONLINE;
  }

  factory HuobiSymbol.fromJson(Map<String, dynamic> json) => _$HuobiSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$HuobiSymbolToJson(this);

}
