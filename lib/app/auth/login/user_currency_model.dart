import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class UserCurrencyModel {
  String? name;
  String? code;
  String? symbol;
  String? exchange_rate;
  UserCurrencyModel({
    this.name,
    this.code,
    this.symbol,
    this.exchange_rate,
  });

  UserCurrencyModel copyWith({
    String? name,
    String? code,
    String? symbol,
    String? exchange_rate,
  }) {
    return UserCurrencyModel(
      name: name ?? this.name,
      code: code ?? this.code,
      symbol: symbol ?? this.symbol,
      exchange_rate: exchange_rate ?? this.exchange_rate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (symbol != null) {
      result.addAll({'symbol': symbol});
    }
    if (exchange_rate != null) {
      result.addAll({'exchange_rate': exchange_rate});
    }

    return result;
  }

  factory UserCurrencyModel.fromMap(Map<String, dynamic> map) {
    return UserCurrencyModel(
      name: map['name'],
      code: map['code'],
      symbol: map['symbol'],
      exchange_rate: map['exchange_rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCurrencyModel.fromJson(String source) =>
      UserCurrencyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserCurrencyModel(name: $name, code: $code, symbol: $symbol, exchange_rate: $exchange_rate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserCurrencyModel &&
        other.name == name &&
        other.code == code &&
        other.symbol == symbol &&
        other.exchange_rate == exchange_rate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        code.hashCode ^
        symbol.hashCode ^
        exchange_rate.hashCode;
  }
}
