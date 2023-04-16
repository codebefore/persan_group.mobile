import 'dart:convert';

class LoginResponseModel {
  final String status;
  final String iD;
  final String doviz;
  LoginResponseModel({
    required this.status,
    required this.iD,
    required this.doviz,
  });

  LoginResponseModel copyWith({
    String? status,
    String? iD,
    String? doviz,
  }) {
    return LoginResponseModel(
      status: status ?? this.status,
      iD: iD ?? this.iD,
      doviz: doviz ?? this.doviz,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Status': status});
    result.addAll({'ID': iD});
    result.addAll({'Doviz': doviz});

    return result;
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      status: map['Status'] ?? '',
      iD: map['ID'] ?? '',
      doviz: map['Doviz'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponseModel(Status: $status, ID: $iD, Doviz: $doviz)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel &&
        other.status == status &&
        other.iD == iD &&
        other.doviz == doviz;
  }

  @override
  int get hashCode => status.hashCode ^ iD.hashCode ^ doviz.hashCode;
}
