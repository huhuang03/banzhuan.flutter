// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huobi_depth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HuobiDepthTick _$HuobiDepthTickFromJson(Map<String, dynamic> json) {
  return HuobiDepthTick(
    (json['bids'] as List)
        ?.map((e) => (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
        ?.toList(),
    (json['asks'] as List)
        ?.map((e) => (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$HuobiDepthTickToJson(HuobiDepthTick instance) =>
    <String, dynamic>{
      'asks': instance.asks,
      'bids': instance.bids,
    };

HuobiDepth _$HuobiDepthFromJson(Map<String, dynamic> json) {
  return HuobiDepth(
    json['version'] as int,
    json['ts'] as int,
    json['tick'] == null
        ? null
        : HuobiDepthTick.fromJson(json['tick'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HuobiDepthToJson(HuobiDepth instance) =>
    <String, dynamic>{
      'version': instance.version,
      'ts': instance.ts,
      'tick': instance.tick,
    };
