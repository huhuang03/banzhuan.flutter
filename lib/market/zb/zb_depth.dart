import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'zb_depth.g.dart';

@JsonSerializable()
class ZbDepth {
  List<List<double>> bids;
  List<List<double>> asks;

  ZbDepth(this.bids, this.asks);

  factory ZbDepth.fromJson(Map<String, dynamic> json) => _$ZbDepthFromJson(json);
  Map<String, dynamic> toJson() => _$ZbDepthToJson(this);
}
