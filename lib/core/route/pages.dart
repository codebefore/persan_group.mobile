import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/login_screen.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen.dart';
import 'package:persangroup_mobile/app/auth/start/start.screen.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

final List<GetPage> getPages = [
  GetPage(name: Routes.starter, page: () => const StartScreen()),
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.signup, page: () => const SignUpScreen()),
];
