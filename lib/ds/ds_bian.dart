import 'package:banzhuan/ds/bean_bian.dart';
import 'package:banzhuan/ds/ds_bian.thyi.dart';
import 'package:thyi/thyi.dart';

const BIAN_BASE_URL = "https://api.binance.com";

abstract class BianApi {
  @GET('/api/v3/exchangeInfo')
  Future<ExchangeInfo> exchangeInfo();
}

class CommonIntercept extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    options.headers["user-agent"] =
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36";
    return options;
  }
}
var thyi = Thyi(BIAN_BASE_URL, persisCookie: false)
  ..interceptors.add(CommonIntercept())
  ..dio.httpClientAdapter;


var bianApi = BianApi$thyiImpl(thyi);
