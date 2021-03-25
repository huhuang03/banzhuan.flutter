import 'package:banzhuan/manager/chajia/ChajiManager.dart';

class ChajiaEngine {
  final ChajiaResultCollector collector;

  ChajiaEngine({this.collector}) {
    // do you want to turn on nullsafe? I want. But for now just hold on.
  }

  /// If we don't need return state, we can use void future
  /// Now we count on your.
  Future _runOnceInternal() {
    /// how to run once??
    return Future.delayed(Duration(seconds: 1), () => {
    });
  }

  Future runOnce() {
    return _runOnceInternal();
  }

}