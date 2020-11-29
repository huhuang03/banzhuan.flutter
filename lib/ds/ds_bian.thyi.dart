// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ThyiGenerator
// **************************************************************************

import 'dart:async';
import 'dart:convert';
import 'ds_bian.dart';
import 'package:thyi/thyi.dart';
import 'package:banzhuan/ds/bean_bian.dart';

class BianApi$thyiImpl extends BianApi {
  BianApi$thyiImpl(this.thyi) {
    this.thyi = thyi;
  }

  Thyi thyi;

  @override
  Future<ExchangeInfo> exchangeInfo() {
    final apiMethod = ApiMethod('GET', '/api/v3/exchangeInfo');
    return apiMethod
        .send(thyi)
        .then((d) => ExchangeInfo.fromJson(jsonDecode(d)));
  }
}
