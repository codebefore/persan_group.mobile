// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ConditionModel {
  int? id;
  String? name;
  String? selected_value;
  ConditionModel({
    this.id,
    this.name,
    this.selected_value,
  });

  ConditionModel copyWith({
    int? id,
    String? name,
    String? selected_value,
  }) {
    return ConditionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      selected_value: selected_value ?? this.selected_value,
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
    if (selected_value != null) {
      result.addAll({'selected_value': selected_value});
    }

    return result;
  }

  factory ConditionModel.fromMap(Map<String, dynamic> map) {
    return ConditionModel(
      id: map['id']?.toInt(),
      name: map['name'],
      selected_value: map['selected_value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConditionModel.fromJson(String source) =>
      ConditionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConditionModel(id: $id, name: $name, selected_value: $selected_value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConditionModel &&
        other.id == id &&
        other.name == name &&
        other.selected_value == selected_value;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ selected_value.hashCode;
}
