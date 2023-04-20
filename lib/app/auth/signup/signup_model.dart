import 'dart:convert';

class SignUpModel {
  String? phone;
  String? phoneCode;
  String? password;
  String? country;
  String? city;
  String? name;
  String? lastName;
  String? email;
  String? company;
  String? currency = "USD";
  SignUpModel({
    this.phone,
    this.phoneCode,
    this.password,
    this.country,
    this.city,
    this.name,
    this.lastName,
    this.email,
    this.company,
    this.currency,
  });

  SignUpModel copyWith({
    String? phone,
    String? phoneCode,
    String? password,
    String? country,
    String? city,
    String? name,
    String? lastName,
    String? email,
    String? company,
    String? currency,
  }) {
    return SignUpModel(
      phone: phone ?? this.phone,
      phoneCode: phoneCode ?? this.phoneCode,
      password: password ?? this.password,
      country: country ?? this.country,
      city: city ?? this.city,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      company: company ?? this.company,
      currency: currency ?? this.currency,
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
    if (city != null) {
      result.addAll({'city': city});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }

    if (email != null) {
      result.addAll({'email': email});
    }

    if (company != null) {
      result.addAll({'company': company});
    }
    if (currency != null) {
      result.addAll({'currency': currency});
    }

    return result;
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      phone: map['phone'],
      phoneCode: map['phoneCode'],
      password: map['password'],
      country: map['country'],
      city: map['city'],
      name: map['name'],
      lastName: map['lastName'],
      email: map['email'],
      company: map['company'],
      currency: map['currency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpModel(phone: $phone, phoneCode: $phoneCode, password: $password, country: $country, city: $city, name: $name, lastName: $lastName, email: $email,  company: $company, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.phone == phone &&
        other.phoneCode == phoneCode &&
        other.password == password &&
        other.country == country &&
        other.city == city &&
        other.name == name &&
        other.lastName == lastName &&
        other.email == email &&
        other.company == company &&
        other.currency == currency;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        phoneCode.hashCode ^
        password.hashCode ^
        country.hashCode ^
        city.hashCode ^
        name.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        company.hashCode ^
        currency.hashCode;
  }
}
