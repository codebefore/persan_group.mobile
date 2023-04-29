import 'dart:convert';

class ProductCategoryModel {
  final String name;
  final String url;

  ProductCategoryModel({
    required this.name,
    required this.url,
  });

  ProductCategoryModel copyWith({
    String? name,
    String? url,
  }) {
    return ProductCategoryModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'url': url});

    return result;
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductCategoryModel(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCategoryModel &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
