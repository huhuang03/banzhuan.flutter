import 'package:banzhuan/market/market_depth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'okex_depth.g.dart';

@JsonSerializable()
class OkexDepth extends MarketDepthNet {
  int lastUpdateId;

  OkexDepth(this.lastUpdateId, List<List<String>> bids, List<List<String>> asks)
      : super(bids, asks);

  factory OkexDepth.fromJson(Map<String, dynamic> json) =>
      _$OkexDepthFromJson(json);

  Map<String, dynamic> toJson() => _$OkexDepthToJson(this);
}
