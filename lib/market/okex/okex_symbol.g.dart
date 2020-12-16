// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okex_symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OkexSymbol _$OkexSymbolFromJson(Map<String, dynamic> json) {
  return OkexSymbol(
    json['base_currency'] as String,
    json['instrument_id'] as String,
    json['quote_currency'] as String,
  );
}

Map<String, dynamic> _$OkexSymbolToJson(OkexSymbol instance) =>
    <String, dynamic>{
      'base_currency': instance.base_currency,
      'instrument_id': instance.instrument_id,
      'quote_currency': instance.quote_currency,
    };
