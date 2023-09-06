// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:persangroup_mobile/app/product/condition_model.dart';

class ProductExcelModel {
  int? id;
  String? cell;
  String? description;
  String? input_or_output;
  ConditionModel? condition;
  String? selected_value;
  double? selected_value_int;
  bool? selected;
  ProductExcelModel({
    this.id,
    this.cell,
    this.description,
    this.input_or_output,
    this.condition,
    this.selected_value,
    this.selected,
  });

  ProductExcelModel copyWith({
    int? id,
    String? cell,
    String? description,
    String? input_or_output,
    ConditionModel? condition,
    String? selected_value,
    bool? selected,
  }) {
    return ProductExcelModel(
      id: id ?? this.id,
      cell: cell ?? this.cell,
      description: description ?? this.description,
      input_or_output: input_or_output ?? this.input_or_output,
      condition: condition ?? this.condition,
      selected_value: selected_value ?? this.selected_value,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (cell != null) {
      result.addAll({'cell': cell});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (input_or_output != null) {
      result.addAll({'input_or_output': input_or_output});
    }
    if (condition != null) {
      result.addAll({'condition': condition!.toMap()});
    }
    if (selected_value != null) {
      result.addAll({'selected_value': selected_value});
    }
    if (selected != null) {
      result.addAll({'selected': selected});
    }

    return result;
  }

  factory ProductExcelModel.fromMap(Map<String, dynamic> map) {
    return ProductExcelModel(
      id: map['id']?.toInt(),
      cell: map['cell'],
      description: map['description'],
      input_or_output: map['input_or_output'],
      condition: map['condition'] != null
          ? ConditionModel.fromMap(map['condition'])
          : null,
      selected_value: map['selected_value'],
      selected: map['selected'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductExcelModel.fromJson(String source) =>
      ProductExcelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductExcelModel(id: $id, cell: $cell, description: $description, input_or_output: $input_or_output, condition: $condition, selected_value: $selected_value, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductExcelModel &&
        other.id == id &&
        other.cell == cell &&
        other.description == description &&
        other.input_or_output == input_or_output &&
        other.condition == condition &&
        other.selected_value == selected_value &&
        other.selected == selected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cell.hashCode ^
        description.hashCode ^
        input_or_output.hashCode ^
        condition.hashCode ^
        selected_value.hashCode ^
        selected.hashCode;
  }
}
