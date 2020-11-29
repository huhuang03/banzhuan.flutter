import 'package:banzhuan/ds/ds_bian.dart';
import 'package:banzhuan/market.dart';

class Bian extends Market {
  Bian() : super("bian");

  @override
  Future refreshSymbols() {
    return bianApi.exchangeInfo();
  }
}