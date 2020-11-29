// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean_bian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaNetSymbol _$BaNetSymbolFromJson(Map<String, dynamic> json) {
  return BaNetSymbol(
    json['symbol'] as String,
    json['baseAsset'] as String,
    json['quoteAsset'] as String,
  );
}

Map<String, dynamic> _$BaNetSymbolToJson(BaNetSymbol instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
    };

ExchangeInfo _$ExchangeInfoFromJson(Map<String, dynamic> json) {
  return ExchangeInfo(
    (json['symbols'] as List)
        ?.map((e) =>
            e == null ? null : BaNetSymbol.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExchangeInfoToJson(ExchangeInfo instance) =>
    <String, dynamic>{
      'symbols': instance.symbols,
    };
