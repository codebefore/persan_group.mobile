// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:persangroup_mobile/app/product/product_excel_model.dart';
import 'package:persangroup_mobile/app/product/product_image_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? brand;
  List<ProductImageModel>? images;
  List<ProductExcelModel>? excel_cell_customer;
  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.images,
    this.excel_cell_customer,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? brand,
    List<ProductImageModel>? images,
    List<ProductExcelModel>? excel_cell_customer,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      images: images ?? this.images,
      excel_cell_customer: excel_cell_customer ?? this.excel_cell_customer,
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
    if (brand != null) {
      result.addAll({'brand': brand});
    }
    if (images != null) {
      result.addAll({'images': images!.map((x) => x.toMap()).toList()});
    }
    if (excel_cell_customer != null) {
      result.addAll({
        'excel_cell_customer':
            excel_cell_customer!.map((x) => x.toMap()).toList()
      });
    }

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      brand: map['brand'],
      images: map['images'] != null
          ? List<ProductImageModel>.from(
              map['images']?.map((x) => ProductImageModel.fromMap(x)))
          : null,
      excel_cell_customer: map['excel_cell_customer'] != null
          ? List<ProductExcelModel>.from(map['excel_cell_customer']
              ?.map((x) => ProductExcelModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, brand: $brand, images: $images, excel_cell_customer: $excel_cell_customer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.brand == brand &&
        listEquals(other.images, images) &&
        listEquals(other.excel_cell_customer, excel_cell_customer);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        brand.hashCode ^
        images.hashCode ^
        excel_cell_customer.hashCode;
  }
}
