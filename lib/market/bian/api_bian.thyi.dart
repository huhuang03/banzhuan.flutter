// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ThyiGenerator
// **************************************************************************

import 'dart:async';
import 'dart:convert';
import 'api_bian.dart';
import 'package:thyi/thyi.dart';
import 'package:banzhuan/market/bian/bean_bian.dart';
import 'package:banzhuan/market/bian/bian_depth.dart';

class BianApi$thyiImpl extends BianApi {
  BianApi$thyiImpl(this.thyi) {
    this.thyi = thyi;
  }

  Thyi thyi;

  @override
  Future<BianExchangeInfo> exchangeInfo() {
    final apiMethod = ApiMethod('GET', '/api/v3/exchangeInfo');
    return apiMethod
        .send(thyi)
        .then((d) => BianExchangeInfo.fromJson(jsonDecode(d)));
  }

  @override
  Future<BianDepth> depth(String depth) {
    final apiMethod = ApiMethod('GET', '/api/v3/depth',
        queries: {"symbol": depth?.toString() ?? ''});
    return apiMethod.send(thyi).then((d) => BianDepth.fromJson(jsonDecode(d)));
  }
}
