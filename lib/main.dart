import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/auth/login/login_screen.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/app/home/home_screen.dart';
import 'package:persangroup_mobile/app/store_binding.dart';
import 'package:persangroup_mobile/core/constant/languages.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/route/pages.dart';
import 'app/auth/auth_controller.dart';
import 'app/auth/login/user_model.dart';
import 'core/constant/color_schemes.dart';

Future<void> main() async {
  await GetStorage.init();
  await singleton();
  await StoreBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    sizeConfig(context);
    Widget? home;
    GetStorage getStorage = GetStorage();
    String? userString = getStorage.read("user");
    String? token = getStorage.read("token");
    if (userString == null || token == null) {
      home = const LoginScreen();
    } else {
      var user = UserModel.fromJson(userString);
      var authcontroller = Get.find<AuthController>();
      authcontroller.setUser(user);
      authcontroller.setToken(token);
      home = const HomeScreen();
    }
    return GetMaterialApp(
      getPages: getPages,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Persan',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.light,
      home: home,
      debugShowCheckedModeBanner: false,
      onReady: () => {},
    );
  }
}
