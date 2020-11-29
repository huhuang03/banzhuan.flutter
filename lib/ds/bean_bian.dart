import 'package:json_annotation/json_annotation.dart';

part 'bean_bian.g.dart';

@JsonSerializable()
class BaNetSymbol {
  String symbol;
  String baseAsset;
  String quoteAsset;

  BaNetSymbol(this.symbol, this.baseAsset, this.quoteAsset);

  factory BaNetSymbol.fromJson(Map<String, dynamic> json) => _$BaNetSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$BaNetSymbolToJson(this);

}

@JsonSerializable()
class ExchangeInfo {
  List<BaNetSymbol> symbols;

  ExchangeInfo(this.symbols);

  factory ExchangeInfo.fromJson(Map<String, dynamic> json) => _$ExchangeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeInfoToJson(this);

}
