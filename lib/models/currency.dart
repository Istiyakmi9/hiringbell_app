class Currency {
  final int id;
  final String? name;
  final String? code;
  final String? symbol;

  Currency({
    required this.id,
    this.name,
    this.code,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
    };
  }

  @override
  String toString() {
    return "$symbol - $name";
  }

  static List<Currency> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Currency.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Currency> currencies) {
    return currencies.map((currency) => currency.toJson()).toList();
  }
}
