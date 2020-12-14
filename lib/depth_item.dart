class DepthItem {
  double price;
  double amount;

  DepthItem(this.price, this.amount);

  factory DepthItem.fromList(List<String> list) {
    return DepthItem(double.parse(list[0]), double.parse(list[1]));
  }

  factory DepthItem.fromListDouble(List<double> list) {
    return DepthItem(list[0], list[1]);
  }

  double sum() {
    return this.amount * this.price;
  }

}
