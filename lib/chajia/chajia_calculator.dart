import 'package:banzhuan/chajia/chajia.dart';
import 'package:banzhuan/market/market.dart';

class ChajiaCalculator {
  Market fromMarket;
  Market toMarket;
  bool isRefreshing = false;
  List<ChajiaItem> items = [];

  ChajiaCalculator(this.fromMarket, this.toMarket);

  Future<Chajia> refresh({ChajiaRefreshCallback callback}) {
    Chajia chajia = Chajia(fromMarket, toMarket);
    return chajia.refresh(callback: callback);
  }

  @override
  String toString() {
    return 'ChajiaCalculator{${fromMarket.nickname()} -> ${toMarket.nickname()}}';
  }
}
