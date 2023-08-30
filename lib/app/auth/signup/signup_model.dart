import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class SignUpModel {
  String? phone;
  String? company;
  String? last_name;
  String? first_name;
  String? username;
  String? email;
  String? currency = "USD";
  String? country;
  String? city;
  String? phonecode;
  String? password;
  String? password2;
  SignUpModel({
    this.phone,
    this.company,
    this.last_name,
    this.first_name,
    this.username,
    this.email,
    this.currency,
    this.country,
    this.city,
    this.phonecode,
    this.password,
    this.password2,
  });

  SignUpModel copyWith({
    String? phone,
    String? company,
    String? last_name,
    String? first_name,
    String? username,
    String? email,
    String? currency,
    String? country,
    String? city,
    String? phonecode,
    String? password,
    String? password2,
  }) {
    return SignUpModel(
      phone: phone ?? this.phone,
      company: company ?? this.company,
      last_name: last_name ?? this.last_name,
      first_name: first_name ?? this.first_name,
      username: username ?? this.username,
      email: email ?? this.email,
      currency: currency ?? this.currency,
      country: country ?? this.country,
      city: city ?? this.city,
      phonecode: phonecode ?? this.phonecode,
      password: password ?? this.password,
      password2: password2 ?? this.password2,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (company != null) {
      result.addAll({'company': company});
    }
    if (last_name != null) {
      result.addAll({'last_name': last_name});
    }
    if (first_name != null) {
      result.addAll({'first_name': first_name});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (currency != null) {
      result.addAll({'currency': currency});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (phonecode != null) {
      result.addAll({'phonecode': phonecode});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (password2 != null) {
      result.addAll({'password2': password2});
    }

    return result;
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      phone: map['phone'],
      company: map['company'],
      last_name: map['last_name'],
      first_name: map['first_name'],
      username: map['username'],
      email: map['email'],
      currency: map['currency'],
      country: map['country'],
      city: map['city'],
      phonecode: map['phonecode'],
      password: map['password'],
      password2: map['password2'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpModel(phone: $phone, company: $company, last_name: $last_name, first_name: $first_name, username: $username, email: $email, currency: $currency, country: $country, city: $city, phonecode: $phonecode, password: $password, password2: $password2)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.phone == phone &&
        other.company == company &&
        other.last_name == last_name &&
        other.first_name == first_name &&
        other.username == username &&
        other.email == email &&
        other.currency == currency &&
        other.country == country &&
        other.city == city &&
        other.phonecode == phonecode &&
        other.password == password &&
        other.password2 == password2;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        company.hashCode ^
        last_name.hashCode ^
        first_name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        currency.hashCode ^
        country.hashCode ^
        city.hashCode ^
        phonecode.hashCode ^
        password.hashCode ^
        password2.hashCode;
  }
}
