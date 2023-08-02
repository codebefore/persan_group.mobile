import 'dart:convert';

class ProductImageModel {
  int? id;
  String? image;
  ProductImageModel({
    required this.id,
    required this.image,
  });

  ProductImageModel copyWith({
    int? id,
    String? image,
  }) {
    return ProductImageModel(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});

    return result;
  }

  factory ProductImageModel.fromMap(Map<String, dynamic> map) {
    return ProductImageModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImageModel.fromJson(String source) =>
      ProductImageModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductImageModel(id: $id, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductImageModel && other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}
