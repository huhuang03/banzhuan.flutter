import 'package:banzhuan/market/bian/bean_bian.dart';
import 'package:banzhuan/market/bian/bian_depth.dart';
import 'package:thyi/thyi.dart';
import 'api_bian.thyi.dart';

const BIAN_BASE_URL = "https://api.binance.com";

abstract class BianApi {
  @GET('/api/v3/exchangeInfo')
  Future<BianExchangeInfo> exchangeInfo();

  @GET('/api/v3/depth')
  Future<BianDepth> depth(@QUERY('symbol') String depth);
}

var thyiBian = Thyi(BIAN_BASE_URL, persisCookie: false);

var bianApi = BianApi$thyiImpl(thyiBian);
