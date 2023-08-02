import 'dart:convert';

class ProductExcelModel {
  int? id;
  String? cell;
  String? description;
  String? input_or_output;
  String? condition;
  ProductExcelModel({
    this.id,
    this.cell,
    this.description,
    this.input_or_output,
    this.condition,
  });

  ProductExcelModel copyWith({
    int? id,
    String? cell,
    String? description,
    String? input_or_output,
    String? condition,
  }) {
    return ProductExcelModel(
      id: id ?? this.id,
      cell: cell ?? this.cell,
      description: description ?? this.description,
      input_or_output: input_or_output ?? this.input_or_output,
      condition: condition ?? this.condition,
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
      result.addAll({'condition': condition});
    }

    return result;
  }

  factory ProductExcelModel.fromMap(Map<String, dynamic> map) {
    return ProductExcelModel(
      id: map['id']?.toInt(),
      cell: map['cell'],
      description: map['description'],
      input_or_output: map['input_or_output'],
      condition: map['condition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductExcelModel.fromJson(String source) =>
      ProductExcelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductImageModel(id: $id, cell: $cell, description: $description, input_or_output: $input_or_output, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductExcelModel &&
        other.id == id &&
        other.cell == cell &&
        other.description == description &&
        other.input_or_output == input_or_output &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cell.hashCode ^
        description.hashCode ^
        input_or_output.hashCode ^
        condition.hashCode;
  }
}
