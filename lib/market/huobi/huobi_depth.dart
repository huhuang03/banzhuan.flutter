import 'package:banzhuan/market/market_depth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'huobi_depth.g.dart';

@JsonSerializable()
class HuobiDepthTick {
  List<List<double>> asks;
  List<List<double>> bids;

  HuobiDepthTick(this.bids, this.asks);

  factory HuobiDepthTick.fromJson(Map<String, dynamic> json) => _$HuobiDepthTickFromJson(json);

  Map<String, dynamic> toJson() => _$HuobiDepthTickToJson(this);

}

@JsonSerializable()
class HuobiDepth {
  int version;
  int ts;
  HuobiDepthTick tick;

  HuobiDepth(this.version, this.ts,
      this.tick); // HuobiDepth(this.version, this.ts, List<List<String>> bids, List<List<String>> asks) : super(bids, asks);

  factory HuobiDepth.fromJson(Map<String, dynamic> json) => _$HuobiDepthFromJson(json);
  
  Map<String, dynamic> toJson() => _$HuobiDepthToJson(this);
}
