import 'dart:convert';

class TokenModel {
  String? access;
  String? refresh;
  TokenModel({
    this.access,
    this.refresh,
  });

  TokenModel copyWith({
    String? access,
    String? refresh,
  }) {
    return TokenModel(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (access != null) {
      result.addAll({'access': access});
    }
    if (refresh != null) {
      result.addAll({'refresh': refresh});
    }

    return result;
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      access: map['access'],
      refresh: map['refresh'],
    );
  }
  factory TokenModel.fromMapInfo(Map<String, dynamic> map) {
    return TokenModel(
      access: map['access'],
      refresh: map['refresh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));

  @override
  String toString() => 'TokenModel(access: $access, refresh: $refresh)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenModel &&
        other.access == access &&
        other.refresh == refresh;
  }

  @override
  int get hashCode => access.hashCode ^ refresh.hashCode;
}
