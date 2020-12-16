// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okex_depth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OkexDepth _$OkexDepthFromJson(Map<String, dynamic> json) {
  return OkexDepth(
    json['lastUpdateId'] as int,
    (json['bids'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    (json['asks'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$OkexDepthToJson(OkexDepth instance) => <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
      'lastUpdateId': instance.lastUpdateId,
    };
