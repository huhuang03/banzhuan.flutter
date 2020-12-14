// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_depth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDepthNet _$MarketDepthNetFromJson(Map<String, dynamic> json) {
  return MarketDepthNet(
    (json['bids'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    (json['asks'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$MarketDepthNetToJson(MarketDepthNet instance) =>
    <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
    };
