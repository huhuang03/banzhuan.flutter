import 'package:json_annotation/json_annotation.dart';

part 'market_depth.g.dart';

@JsonSerializable()
class MarketDepthNet {
  List<List<String>> bids;
  List<List<String>> asks;

  MarketDepthNet(this.bids, this.asks);

  factory MarketDepthNet.fromJson(Map<String, dynamic> json) => _$MarketDepthNetFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDepthNetToJson(this);
}
