import 'package:json_annotation/json_annotation.dart';

import '../market_depth.dart';

part 'bian_depth.g.dart';

@JsonSerializable()
class BianDepth extends MarketDepthNet {
  int lastUpdateId;

  BianDepth(this.lastUpdateId, List<List<String>> bids, List<List<String>> asks): super(bids, asks);

  factory BianDepth.fromJson(Map<String, dynamic> json) => _$BianDepthFromJson(json);

  Map<String, dynamic> toJson() => _$BianDepthToJson(this);

}
