class CurrencyModel {
  CurrencyModel({this.baseCurrency, this.compareCurrency});

  String baseCurrency;
  List<String> compareCurrency = [];

  void changeBaseCurrency(String newCurrency) {
    this.baseCurrency = newCurrency;
  }

  void addCompareCurrency(String newCurrency) {
    if (this.compareCurrency == null) {
      this.compareCurrency = [newCurrency];
    } else {
      this.compareCurrency.add(newCurrency);
    }
  }
}
