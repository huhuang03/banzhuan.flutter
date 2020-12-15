// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huobi_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HuobiCurrencyNet _$HuobiCurrencyNetFromJson(Map<String, dynamic> json) {
  return HuobiCurrencyNet(
    json['code'] as int,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HuobiCurrency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HuobiCurrencyNetToJson(HuobiCurrencyNet instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

HuobiCurrency _$HuobiCurrencyFromJson(Map<String, dynamic> json) {
  return HuobiCurrency(
    json['currency'] as String,
    (json['chains'] as List)
        ?.map((e) =>
            e == null ? null : HuobiChain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HuobiCurrencyToJson(HuobiCurrency instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'chains': instance.chains,
    };

HuobiChain _$HuobiChainFromJson(Map<String, dynamic> json) {
  return HuobiChain(
    json['chain'] as String,
    json['depositStatus'] as String,
    json['withdrawStatus'] as String,
  );
}

Map<String, dynamic> _$HuobiChainToJson(HuobiChain instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'depositStatus': instance.depositStatus,
      'withdrawStatus': instance.withdrawStatus,
    };
