import 'package:banzhuan/depth.dart';
import 'package:banzhuan/symbol.dart';

abstract class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols;

  Market(this.name);

  Future<List<Symbol>> refreshSymbols();

  Future<Depth> refreshDepth(Symbol symbol);

  String nickname() {
    return name;
  }
}