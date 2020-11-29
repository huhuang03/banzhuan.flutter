import 'package:banzhuan/ds/bean_bian.dart';
import 'package:banzhuan/ds/ds_bian.thyi.dart';
import 'package:thyi/thyi.dart';

const BIAN_BASE_URL = "https://api.binance.com";

abstract class BianApi {
  @GET('/api/v3/exchangeInfo')
  Future<ExchangeInfo> exchangeInfo();
}

var bianApi = BianApi$thyiImpl(Thyi(BIAN_BASE_URL, persisCookie: false));