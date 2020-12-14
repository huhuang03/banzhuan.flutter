// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huobi_symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HuobiSymbolNet _$HuobiSymbolNetFromJson(Map<String, dynamic> json) {
  return HuobiSymbolNet(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : HuobiSymbol.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HuobiSymbolNetToJson(HuobiSymbolNet instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HuobiSymbol _$HuobiSymbolFromJson(Map<String, dynamic> json) {
  return HuobiSymbol(
    json['base-currency'] as String,
    json['quote-currency'] as String,
    json['price-precision'] as int,
    json['amount-precision'] as int,
    json['state'] as String,
    json['symbol'] as String,
  );
}

Map<String, dynamic> _$HuobiSymbolToJson(HuobiSymbol instance) =>
    <String, dynamic>{
      'base-currency': instance.baseCurrency,
      'quote-currency': instance.quoteCurrency,
      'price-precision': instance.pricePrecision,
      'amount-precision': instance.amountPrecision,
      'state': instance.state,
      'symbol': instance.symbol,
    };
