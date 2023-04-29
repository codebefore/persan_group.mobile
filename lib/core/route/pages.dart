import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/login_screen.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen_last.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen_more.dart';
import 'package:persangroup_mobile/app/auth/start/start.screen.dart';
import 'package:persangroup_mobile/app/home/home_screen.dart';
import 'package:persangroup_mobile/app/product/category_detail_screen.dart';
import 'package:persangroup_mobile/app/product/category_screen.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

final List<GetPage> getPages = [
  GetPage(name: Routes.starter, page: () => const StartScreen()),
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.signup, page: () => const SignUpScreen()),
  GetPage(name: Routes.signupmore, page: () => const SignUpScreenMore()),
  GetPage(name: Routes.signuplast, page: () => const SignUpScreenLast()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.category, page: () => const CategoryScreen()),
  GetPage(
      name: Routes.categorydetail, page: () => const CategoryDetailScreen()),
];
