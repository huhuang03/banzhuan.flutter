// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ThyiGenerator
// **************************************************************************

import 'dart:async';
import 'dart:convert';
import 'api_okex.dart';
import 'package:thyi/thyi.dart';
import 'package:banzhuan/market/okex/okex_depth.dart';

class OkexApi$thyiImpl extends OkexApi {
  OkexApi$thyiImpl(this.thyi) {
    this.thyi = thyi;
  }

  Thyi thyi;

  @override
  Future<OkexDepth> book(String symbol, String size, String depth) {
    final apiMethod = ApiMethod(
        'GET', '/api/spot/v3/instruments/${symbol}/book', queries: {
      "size": size?.toString() ?? '',
      "depth": depth?.toString() ?? ''
    });
    return apiMethod.send(thyi).then((d) => OkexDepth.fromJson(jsonDecode(d)));
  }
}
