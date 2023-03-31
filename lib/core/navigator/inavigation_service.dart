import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> to({String? path, Object? data});
  Future<void> toWithoutBack({String? path, Object? data});
  Future<void> back(BuildContext context);
}
