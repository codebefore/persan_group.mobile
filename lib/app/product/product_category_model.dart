import 'dart:convert';

import 'package:get/get_connect/http/src/request/request.dart';

class ProductCategoryModel {
  final String id;
  final String name;
  final String apiname;
  final String url;
  final List<ProductCategoryModel> childs;
  final String message;
  final List<String> types;

  ProductCategoryModel(
      {required this.id,
      required this.name,
      required this.apiname,
      required this.url,
      required this.childs,
      required this.message,
      required this.types});

  ProductCategoryModel copyWith({
    String? id,
    String? name,
    String? apiname,
    String? url,
    List<ProductCategoryModel>? childs,
    String? message,
    List<String>? types,
  }) {
    return ProductCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      apiname: apiname ?? this.apiname,
      url: url ?? this.url,
      childs: childs ?? this.childs,
      message: message ?? this.message,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'apiname': apiname});
    result.addAll({'url': url});
    result.addAll({'childs': childs});
    result.addAll({'message': message});
    result.addAll({'types': types});

    return result;
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    var childs = <ProductCategoryModel>[];
    if (map['childs'] != null) {
      childs = (map['childs'] as List)
          .map((c) => ProductCategoryModel.fromMap(c))
          .toList();
    }
    var types = <String>[];
    if (map['types'] != null) {
      types = (map['types'] as List<String>).map((c) => c).toList();
    }
    return ProductCategoryModel(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        apiname: map['apiname'] ?? '',
        url: map['url'] ?? '',
        childs: childs,
        message: map['message'] ?? '',
        types: types);
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductCategoryModel(id: $id, name: $name, apiname: $apiname, url: $url,childs: $childs,message: $message,types: $types)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCategoryModel &&
        other.id == id &&
        other.name == name &&
        other.apiname == apiname &&
        other.url == url &&
        other.childs == childs &&
        other.types == types &&
        other.message == message;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
