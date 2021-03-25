// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zb_depth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZbDepth _$ZbDepthFromJson(Map<String, dynamic> json) {
  return ZbDepth(
    (json['bids'] as List)
        ?.map((e) => (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
        ?.toList(),
    (json['asks'] as List)
        ?.map((e) => (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$ZbDepthToJson(ZbDepth instance) => <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
    };
