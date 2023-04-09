import 'dart:convert';

class BaseResponse {
  final bool? success;
  final dynamic data;
  final String? message;
  final int? count;
  final int? statusCode;
  final bool? redirectRefreshToken;
  BaseResponse({
    this.count,
    this.success,
    this.data,
    this.message,
    this.statusCode,
    this.redirectRefreshToken = false,
  });

  BaseResponse copyWith({
    int? count,
    bool? success,
    dynamic data,
    String? message,
    int? statusCode,
    bool? redirectRefreshToken,
  }) {
    return BaseResponse(
      count: count ?? this.count,
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      redirectRefreshToken: redirectRefreshToken ?? this.redirectRefreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (success != null) {
      result.addAll({'success': success});
    }
    if (data != null) {
      result.addAll({'data': data});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (statusCode != null) {
      result.addAll({'statusCode': statusCode});
    }
    result.addAll({'redirectRefreshToken': redirectRefreshToken});

    return result;
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      success: map['success'],
      data: map['data'] ?? "",
      message: map['message'],
      statusCode: map['statusCode']?.toInt(),
      redirectRefreshToken: map['redirectRefreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) =>
      BaseResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BaseResponse(success: $success, data: $data, message: $message, statusCode: $statusCode, redirectRefreshToken: $redirectRefreshToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponse &&
        other.success == success &&
        other.data == data &&
        other.message == message &&
        other.statusCode == statusCode &&
        other.redirectRefreshToken == redirectRefreshToken;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        data.hashCode ^
        message.hashCode ^
        statusCode.hashCode ^
        redirectRefreshToken.hashCode;
  }
}
