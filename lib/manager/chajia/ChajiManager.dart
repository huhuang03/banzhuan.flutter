import 'dart:async';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/manager/chajia/ChajiaEngine.dart';
import 'package:banzhuan/base/symbol.dart';
import 'package:banzhuan/market/market.dart';

import 'chajia_result.dart';

class ChajiaManager {
  ChajiaEngine chajiaEngine;
  bool _isRunning = false;

  int durationSeconds = MIN_DURATION_SECONDS;

  /// 最少的时间间隔
  static var MIN_DURATION_SECONDS = 60;

  Timer _timer;

  // but how can I show indicator??
  void start() {
    if (_isRunning) {
      print("already started");
      return;
    }

    _isRunning = true;
    if (_timer != null) {
      _timer.cancel();
    }
    // ok, I trust you can work.
    _timer = new Timer.periodic(Duration(seconds: durationSeconds), (Timer t) {
      print("can I repeat?");
      /// 目前错误处理，很简单的打印出来即可。
    });
  }

  /// how do I give the result??
  Future runOnce(ChajiaResultCollector collector) {
    chajiaEngine = new ChajiaEngine(collector: collector);
    return chajiaEngine.runOnce();
  }

  bool isRunning() {
    return _isRunning;
  }

  void stop() {
    if (_isRunning) {
      if (_timer != null) {
        _timer.cancel();
        _timer = null;
      }
      _isRunning = false;
    }
  }
}

class ChajiaMonitorCallback {
  //
  // final Function(List<Symbol>) onFromMarketSymbolGet;
  // final Function(List<Symbol>) onToMarketSymbolGet;
  // final Function(List<ChajiaItem>) onSameSymbolGet;
  // final Function(Chajia chajia, ChajiaItem item) onDepthGet;
  // final Function(List<ChajiaItem>) onAllDepthGet;
  //
  // ChajiaRefreshCallback({this.onFromMarketSymbolGet, this.onToMarketSymbolGet, this.onSameSymbolGet, this.onDepthGet, this.onAllDepthGet});
}



/// what can you have??

class ChajiaResultCollector {

  ChajiaResult getResult() {

  }

}