import 'dart:convert';

class OfferResponseModel {
  int? id;
  String? price;
  OfferResponseModel({
    this.id,
    this.price,
  });

  OfferResponseModel copyWith({
    int? id,
    String? price,
  }) {
    return OfferResponseModel(
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (price != null) {
      result.addAll({'price': price});
    }

    return result;
  }

  factory OfferResponseModel.fromMap(Map<String, dynamic> map) {
    return OfferResponseModel(
      id: map['id']?.toInt(),
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferResponseModel.fromJson(String source) =>
      OfferResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'OfferResponseModel(id: $id, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferResponseModel &&
        other.id == id &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode;
}
