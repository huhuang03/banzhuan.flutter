import 'package:banzhuan/market.dart';
import 'package:banzhuan/symbol.dart';
import 'package:flutter/material.dart';

class Chajia {
  Market fromMarket;
  Market toMarket;

  Chajia(this.fromMarket, this.toMarket) {}

  List<Symbol> getSameSymbols() {
    List<Symbol> sameSymbols = List();
    this.fromMarket.symbols.forEach((symbol1) {
        if (this.toMarket.symbols.contains(symbol1)) {
            sameSymbols.add(symbol1);
        }
    });
    return sameSymbols;
  }

  Future refresh() {
    print("chajia begin refresh");
    fromMarket.refreshSymbols()
    .then((value) {
      return toMarket.refreshSymbols();
    })
    .then((value) => getSameSymbols())
    .then((sameSymbols) {
      print("sameSymbols: $sameSymbols");
      return 1;
    });
  }

  @override
  String toString() {
    return 'Chajia{${fromMarket.nickname()} -> ${toMarket.nickname()}}';
  }
}
