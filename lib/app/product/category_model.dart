import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:persangroup_mobile/app/product/product_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  List<ProductModel>? products;
  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.products,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    List<ProductModel>? products,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (products != null) {
      result.addAll({'products': products!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      products: map['products'] != null
          ? List<ProductModel>.from(
              map['products']?.map((x) => ProductModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ image.hashCode ^ products.hashCode;
  }
}
