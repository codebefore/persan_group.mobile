import 'dart:convert';

class PriceModel {
  String? width;
  String? height;
  String? productName;
  String? type;
  String? userId;
  String? column;
  String? profit;
  PriceModel({
    this.width,
    this.height,
    this.productName,
    this.type,
    this.userId,
    this.column,
    this.profit,
  });

  PriceModel copyWith({
    String? width,
    String? height,
    String? productName,
    String? type,
    String? userId,
    String? column,
    String? profit,
  }) {
    return PriceModel(
      width: width ?? this.width,
      height: height ?? this.height,
      productName: productName ?? this.productName,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      column: column ?? this.column,
      profit: profit ?? this.profit,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'width': width});
    result.addAll({'height': height});
    result.addAll({'productName': productName});
    result.addAll({'type': type});
    result.addAll({'userId': userId});
    result.addAll({'column': column});
    result.addAll({'profit': profit});

    return result;
  }

  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
      width: map['width'] ?? '',
      height: map['height'] ?? '',
      productName: map['productName'] ?? '',
      type: map['type'] ?? '',
      userId: map['userId'] ?? '',
      column: map['column'] ?? '',
      profit: map['profit'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceModel.fromJson(String source) =>
      PriceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PriceModel(width: $width, height: $height, productName: $productName, type: $type, userId: $userId, column: $column, profit: $profit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PriceModel &&
        other.width == width &&
        other.height == height &&
        other.productName == productName &&
        other.type == type &&
        other.userId == userId &&
        other.column == column &&
        other.profit == profit;
  }

  @override
  int get hashCode {
    return width.hashCode ^
        height.hashCode ^
        productName.hashCode ^
        type.hashCode ^
        userId.hashCode ^
        column.hashCode ^
        profit.hashCode;
  }
}
