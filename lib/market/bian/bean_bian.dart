import 'package:banzhuan/market/market_depth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bean_bian.g.dart';

@JsonSerializable()
class BianSymbol {
  static const STATE_TRADING = "TRADING";

  String symbol;
  String baseAsset;
  String quoteAsset;
  String status;

  BianSymbol(this.symbol, this.baseAsset, this.quoteAsset, this.status);

  bool isTrading() {
    return STATE_TRADING == status;
  }

  factory BianSymbol.fromJson(Map<String, dynamic> json) =>
      _$BianSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$BianSymbolToJson(this);
}

@JsonSerializable()
class BianExchangeInfo {
  List<BianSymbol> symbols;

  BianExchangeInfo(this.symbols);

  factory BianExchangeInfo.fromJson(Map<String, dynamic> json) =>
      _$BianExchangeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BianExchangeInfoToJson(this);
}

