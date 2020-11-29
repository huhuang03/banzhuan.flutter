import 'package:banzhuan/symbol.dart';

class Market {
  // get coins
  String name;
  String base;
  List<Symbol> symbols;

  Market(this.name) {}

  Future refreshSymbols() {}

  Future depth(Symbol symbol) {}

  String nickname() {
    return name;
  }
}