// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ThyiGenerator
// **************************************************************************

import 'dart:async';
import 'dart:convert';
import 'api_zb.dart';
import 'package:thyi/thyi.dart';
import 'package:banzhuan/market/zb/zb_depth.dart';

class ApiZb$thyiImpl extends ApiZb {
  ApiZb$thyiImpl(this.thyi) {
    this.thyi = thyi;
  }

  Thyi thyi;

  @override
  Future<String> markets() {
    final apiMethod = ApiMethod('GET', '/data/v1/markets');
    return apiMethod.send(thyi);
  }

  @override
  Future<ZbDepth> depth(String symbol) {
    final apiMethod = ApiMethod('GET', '/data/v1/depth',
        queries: {"market": symbol?.toString() ?? ''});
    return apiMethod.send(thyi).then((d) => ZbDepth.fromJson(jsonDecode(d)));
  }
}
