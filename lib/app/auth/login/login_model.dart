import 'dart:convert';

class LoginModel {
  String? phone;
  String? password;
  LoginModel({
    this.phone,
    this.password,
  });

  LoginModel copyWith({
    String? phone,
    String? password,
  }) {
    return LoginModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (password != null) {
      result.addAll({'password': password});
    }

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      phone: map['phone'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(phone: $phone, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.phone == phone &&
        other.password == password;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode;
}
