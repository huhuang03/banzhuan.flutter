import 'package:banzhuan/market/huobi/api_huobi.thyi.dart';
import 'package:banzhuan/market/huobi/huobi_currency.dart';
import 'package:banzhuan/market/huobi/huobi_depth.dart';
import 'package:banzhuan/market/huobi/huobi_symbol.dart';
import 'package:thyi/thyi.dart';

const HUOBI_BASE = "https://api.huobi.pro";

abstract class HuobiApi {
  @GET('/v1/common/symbols')
  Future<HuobiSymbolNet> symbols();

  @GET('/market/depth')
  Future<HuobiDepth> depth(@QUERY('symbol') String symbol, {@QUERY('type')String type = "step2"});

  @GET('/v2/reference/currencies')
  Future<HuobiCurrencyNet> currencies();
}

var thyiHuobi = Thyi(HUOBI_BASE, persisCookie: false);

var houbiApi = HuobiApi$thyiImpl(thyiHuobi);
