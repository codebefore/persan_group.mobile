import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: non_constant_identifier_names

class CreateOfferRequestModel {
  List<dynamic>? input_body;
  List<dynamic>? output_body;
  int? product;
  String? condition;
  CreateOfferRequestModel({
    this.input_body,
    this.output_body,
    this.product,
    this.condition,
  });

  CreateOfferRequestModel copyWith({
    List<dynamic>? input_body,
    List<dynamic>? output_body,
    int? product,
    String? condition,
  }) {
    return CreateOfferRequestModel(
      input_body: input_body ?? this.input_body,
      output_body: output_body ?? this.output_body,
      product: product ?? this.product,
      condition: condition ?? this.condition,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (input_body != null) {
      result.addAll({'input_body': input_body});
    }
    if (output_body != null) {
      result.addAll({'output_body': output_body});
    }
    if (product != null) {
      result.addAll({'product': product});
    }
    if (condition != null) {
      result.addAll({'condition': condition});
    }

    return result;
  }

  factory CreateOfferRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateOfferRequestModel(
      input_body: List<dynamic>.from(map['input_body']),
      output_body: List<dynamic>.from(map['output_body']),
      product: map['product']?.toInt(),
      condition: map['condition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateOfferRequestModel.fromJson(String source) =>
      CreateOfferRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateOfferRequestModel(input_body: $input_body, output_body: $output_body, product: $product, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateOfferRequestModel &&
        listEquals(other.input_body, input_body) &&
        listEquals(other.output_body, output_body) &&
        other.product == product &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return input_body.hashCode ^
        output_body.hashCode ^
        product.hashCode ^
        condition.hashCode;
  }
}
