import 'package:flutter/material.dart';
import '../../app/auth/login/home_secreen.dart';
import '../../app/auth/login/login_secreen.dart';
import '../../app/auth/login/splash_secreen.dart';
import 'navigation_parameters.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationParameters.login:
        return navigate(const LoginScreen(), NavigationParameters.login);
      case NavigationParameters.splash:
        return navigate(const SplashScreen(), NavigationParameters.splash);
      case NavigationParameters.home:
        return navigate(const HomeScreen(), NavigationParameters.home);
      // case NavigationParameters.checkSharedPreferences:
      //   return navigate(const CheckSharedPreferences(),
      //       NavigationParameters.checkSharedPreferences);
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }

  MaterialPageRoute navigate(Widget widget, String pageName,
      {Object? arguments}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName, arguments: arguments));
  }
}
