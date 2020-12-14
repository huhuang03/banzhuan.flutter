// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bian_depth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BianDepth _$BianDepthFromJson(Map<String, dynamic> json) {
  return BianDepth(
    json['lastUpdateId'] as int,
    (json['bids'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    (json['asks'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$BianDepthToJson(BianDepth instance) => <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
      'lastUpdateId': instance.lastUpdateId,
    };
