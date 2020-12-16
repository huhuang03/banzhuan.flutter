import 'package:json_annotation/json_annotation.dart';

part 'okex_symbol.g.dart';

@JsonSerializable()
class OkexSymbol {
  String base_currency;
  String instrument_id;
  String quote_currency;

  OkexSymbol(this.base_currency, this.instrument_id, this.quote_currency);

  factory OkexSymbol.fromJson(Map<String, dynamic> json) => _$OkexSymbolFromJson(json);
  Map<String, dynamic> toJson() => _$OkexSymbolToJson(this);
}