// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ThyiGenerator
// **************************************************************************

import 'dart:async';
import 'dart:convert';
import 'api_huobi.dart';
import 'package:thyi/thyi.dart';
import 'package:banzhuan/market/huobi/huobi_symbol.dart';
import 'package:banzhuan/market/huobi/huobi_depth.dart';
import 'package:banzhuan/market/huobi/huobi_currency.dart';

class HuobiApi$thyiImpl extends HuobiApi {
  HuobiApi$thyiImpl(this.thyi) {
    this.thyi = thyi;
  }

  Thyi thyi;

  @override
  Future<HuobiSymbolNet> symbols() {
    final apiMethod = ApiMethod('GET', '/v1/common/symbols');
    return apiMethod
        .send(thyi)
        .then((d) => HuobiSymbolNet.fromJson(jsonDecode(d)));
  }

  @override
  Future<HuobiDepth> depth(String symbol, {String type = "step2"}) {
    final apiMethod = ApiMethod('GET', '/market/depth', queries: {
      "symbol": symbol?.toString() ?? '',
      "type": type?.toString() ?? ''
    });
    return apiMethod.send(thyi).then((d) => HuobiDepth.fromJson(jsonDecode(d)));
  }

  @override
  Future<HuobiCurrencyNet> currencies() {
    final apiMethod = ApiMethod('GET', '/v2/reference/currencies');
    return apiMethod
        .send(thyi)
        .then((d) => HuobiCurrencyNet.fromJson(jsonDecode(d)));
  }
}
