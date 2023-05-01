import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/app/product/category_screen.dart';
import 'package:persangroup_mobile/app/store_binding.dart';
import 'package:persangroup_mobile/core/constant/languages.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/route/pages.dart';
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
    // final authcontoller = Get.find<AuthController>();
    sizeConfig(context);
    return GetMaterialApp(
      getPages: getPages,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Persan',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.light,
      home: const CategoryScreen(),
      debugShowCheckedModeBanner: false,
      onReady: () => {},
    );
  }
}
