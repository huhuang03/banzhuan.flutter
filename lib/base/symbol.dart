import 'package:banzhuan/base/coin.dart';
import 'package:banzhuan/market/bian/bean_bian.dart';
import 'package:banzhuan/market/huobi/huobi_symbol.dart';
import 'package:banzhuan/market/okex/okex_symbol.dart';

class Symbol {
  Coin baseCoin;
  Coin quoteCoin;
  // name
  String symbol;

  Symbol(this.baseCoin, this.quoteCoin, this.symbol); // Symbol(this.baseCoin, this.quoteCoin);

  factory Symbol.fromBian(BianSymbol bianSymbol) {
    return Symbol(Coin(bianSymbol.baseAsset), Coin(bianSymbol.quoteAsset), bianSymbol.symbol);
  }

  factory Symbol.fromHuobi(HuobiSymbol huobiSymbol) {
    return Symbol(Coin(huobiSymbol.baseCurrency), Coin(huobiSymbol.quoteCurrency), huobiSymbol.symbol);
  }

  factory Symbol.fromOkex(OkexSymbol okexSymbol) {
    return Symbol(Coin.canWidthDrawAndDeposit(okexSymbol.base_currency), Coin.canWidthDrawAndDeposit(okexSymbol.quote_currency), okexSymbol.instrument_id);
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
