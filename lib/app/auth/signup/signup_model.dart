import 'dart:convert';

class SignUpModel {
  String? phone;
  String? phoneCode;
  String? password;
  String? country;
  SignUpModel({
    this.phone,
    this.phoneCode,
    this.password,
    this.country,
  });

  SignUpModel copyWith({
    String? phone,
    String? phoneCode,
    String? password,
    String? country,
  }) {
    return SignUpModel(
      phone: phone ?? this.phone,
      phoneCode: phoneCode ?? this.phoneCode,
      password: password ?? this.password,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (phoneCode != null) {
      result.addAll({'phoneCode': phoneCode});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (country != null) {
      result.addAll({'country': country});
    }

    return result;
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      phone: map['phone'],
      phoneCode: map['phoneCode'],
      password: map['password'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpModel(phone: $phone, phoneCode: $phoneCode, password: $password, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.phone == phone &&
        other.phoneCode == phoneCode &&
        other.password == password &&
        other.country == country;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        phoneCode.hashCode ^
        password.hashCode ^
        country.hashCode;
  }
}
