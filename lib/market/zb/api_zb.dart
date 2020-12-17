import 'package:banzhuan/market/market_depth.dart';
import 'package:banzhuan/market/zb/api_zb.thyi.dart';
import 'package:banzhuan/market/zb/zb_depth.dart';
import 'package:thyi/thyi.dart';

const ZB_BASE_URL_URL = "http://api.zb.live/";

abstract class ApiZb {
  @GET('/data/v1/markets')
  Future<String> markets();

  @GET('/data/v1/depth')
  Future<ZbDepth> depth(@QUERY('market') String symbol);
}

var thyiZb = Thyi(ZB_BASE_URL_URL, persisCookie: false);

var apiZb = ApiZb$thyiImpl(thyiZb);


