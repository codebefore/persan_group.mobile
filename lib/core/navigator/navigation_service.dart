import 'package:flutter/material.dart';

import 'inavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> to({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> toWithoutBack({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        path!, (Route<dynamic> route) => false,
        arguments: data);
  }

  @override
  Future<void> back(BuildContext context) async {
    navigatorKey.currentState?.pop(context);
  }
}
