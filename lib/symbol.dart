import 'package:banzhuan/coin.dart';
import 'package:banzhuan/depth.dart';
import 'package:banzhuan/market/bian/bean_bian.dart';
import 'package:banzhuan/market/huobi/huobi_symbol.dart';

class Symbol {
  Coin baseCoin;
  Coin quoteCoin;
  String symbol;

  Depth depth;

  Symbol(this.baseCoin, this.quoteCoin, this.symbol); // Symbol(this.baseCoin, this.quoteCoin);

  factory Symbol.fromBian(BianSymbol bianSymbol) {
    return Symbol(Coin(bianSymbol.baseAsset), Coin(bianSymbol.quoteAsset), bianSymbol.symbol);
  }

  factory Symbol.fromHuobi(HuobiSymbol huobiSymbol) {
    return Symbol(Coin(huobiSymbol.baseCurrency), Coin(huobiSymbol.quoteCurrency), huobiSymbol.symbol);
  }

  bool get isBtc {
    return quoteCoin.isBtc;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Symbol &&
          runtimeType == other.runtimeType &&
          baseCoin == other.baseCoin &&
          quoteCoin == other.quoteCoin;

  @override
  int get hashCode => baseCoin.hashCode ^ quoteCoin.hashCode;

  @override
  String toString() {
    return 'Symbol{baseCoin: $baseCoin, quoteCoin: $quoteCoin, symbol: $symbol}';
  }
}
