// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean_bian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BianSymbol _$BianSymbolFromJson(Map<String, dynamic> json) {
  return BianSymbol(
    json['symbol'] as String,
    json['baseAsset'] as String,
    json['quoteAsset'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$BianSymbolToJson(BianSymbol instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
      'status': instance.status,
    };

BianExchangeInfo _$BianExchangeInfoFromJson(Map<String, dynamic> json) {
  return BianExchangeInfo(
    (json['symbols'] as List)
        ?.map((e) =>
            e == null ? null : BianSymbol.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BianExchangeInfoToJson(BianExchangeInfo instance) =>
    <String, dynamic>{
      'symbols': instance.symbols,
    };
