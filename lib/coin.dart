class Coin {
  String name = "unknown";
  bool hasGetStates = false;
  // 是否可冲币
  bool canDeposit = false;

  // 是否可提币
  bool canWithDraw = false;

  Coin(this.name);

  factory Coin.canWidthDrawAndDeposit(String name) {
    return Coin(name)
        ..canDeposit = true
        ..canWithDraw = true;
  }

  String get fixName {
    return name.toLowerCase();
  }

  @override
  String toString() {
    return 'Coin{name: $fixName}';
  }

  bool get isBtc {
    return "btc" == fixName;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Coin && runtimeType == other.runtimeType && fixName == other.fixName;

  @override
  int get hashCode => fixName.hashCode;

}
