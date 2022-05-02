import 'package:banzhuan/manager/chajia/ChajiManager.dart';
import 'package:banzhuan/market/market_manager.dart';

class ChajiaEngine {
  final ChajiaResultCollector collector;

  ChajiaEngine({this.collector}) {
    // do you want to turn on nullsafe? I want. But for now just hold on.
  }

  /// If we don't need return state, we can use void future
  /// Now we count on your.
  Future _runOnceInternal() {
    var symbolFutures = marketMgr.markets.map((e) =>
        e.refreshSymbols().then((value) {
          return null;
        }));
    return Future.wait(symbolFutures).then((value) {
      // now we notify??
      return value;
    });
    // how to run once??
    // Now what can we do?
    // First we refresh all the markets's symbol

    // I think we can refresh async


    return Future.delayed(Duration(seconds: 1), () => {
    });
  }

  Future runOnce() {
    return _runOnceInternal();
  }

}