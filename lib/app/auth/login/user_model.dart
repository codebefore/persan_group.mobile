import 'dart:convert';

import 'package:persangroup_mobile/app/auth/login/user_currency_model.dart';

class UserModel {
  int? id;
  String? company;
  String? phone;
  String? email;
  String? country;
  String? city;
  String? firstname;
  String? lastname;
  UserCurrencyModel? currency;
  UserModel({
    this.id,
    this.company,
    this.phone,
    this.email,
    this.country,
    this.city,
    this.firstname,
    this.lastname,
    this.currency,
  });

  UserModel copyWith({
    int? id,
    String? company,
    String? phone,
    String? email,
    String? country,
    String? city,
    String? firstname,
    String? lastname,
    UserCurrencyModel? currency,
  }) {
    return UserModel(
      id: id ?? this.id,
      company: company ?? this.company,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      country: country ?? this.country,
      city: city ?? this.city,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (company != null) {
      result.addAll({'company': company});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (firstname != null) {
      result.addAll({'firstname': firstname});
    }
    if (lastname != null) {
      result.addAll({'lastname': lastname});
    }
    if (currency != null) {
      result.addAll({'currency': currency!.toMap()});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      company: map['company'],
      phone: map['phone'],
      email: map['email'],
      country: map['country'],
      city: map['city'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      currency: map['currency'] != null
          ? UserCurrencyModel.fromMap(map['currency'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, company: $company, phone: $phone, email: $email, country: $country, city: $city, firstname: $firstname, lastname: $lastname, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.company == company &&
        other.phone == phone &&
        other.email == email &&
        other.country == country &&
        other.city == city &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.currency == currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        company.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        country.hashCode ^
        city.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        currency.hashCode;
  }
}
