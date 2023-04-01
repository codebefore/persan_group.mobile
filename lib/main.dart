import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/start/start.screen.dart';
import 'package:persangroup_mobile/core/constant/languages.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'core/constant/color_schemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    sizeConfig(context);
    return GetMaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        title: 'Pestomat',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: ThemeMode.light,
        home: const StartScreen(),
        debugShowCheckedModeBanner: false);
  }
}
