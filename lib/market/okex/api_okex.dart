import 'package:banzhuan/market/okex/okex_depth.dart';
import 'package:banzhuan/market/okex/okex_symbol.dart';
import 'package:thyi/thyi.dart';

const OKEX_BASE_URL = "https://www.okex.com";

abstract class OkexApi {
  @GET('/api/spot/v3/instruments')
  Future<OkexSymbol> instruments;

  @GET('/api/spot/v3/instruments/{symbol}/book')
  Future<OkexDepth> book(@PATH('symbol') String symbol,
      @QUERY('size') String size, @QUERY('depth') String depth);
}
