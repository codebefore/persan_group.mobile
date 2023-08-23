import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/app/store_binding.dart';
import 'package:persangroup_mobile/core/constant/languages.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/route/pages.dart';
import 'package:persangroup_mobile/core/route/routes.dart';
import 'core/constant/color_schemes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  singleton();
  StoreBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<double> whenNotZero(Stream<double> source) async {
      await for (double value in source) {
        if (value > 0) {
          sizeConfig(context);
          return value;
        }
      }
      return 0;
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: FutureBuilder(
          future: whenNotZero(
            Stream<double>.periodic(const Duration(seconds: 1),
                (x) => MediaQuery.of(context).size.width),
          ),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data! > 0) {
                return GetMaterialApp(
                  getPages: getPages,
                  translations: Languages(),
                  locale: Get.deviceLocale,
                  fallbackLocale: const Locale('en', 'US'),
                  title: 'Persan',
                  theme: ThemeData(
                      useMaterial3: true, colorScheme: lightColorScheme),
                  darkTheme: ThemeData(
                      useMaterial3: true, colorScheme: darkColorScheme),
                  themeMode: ThemeMode.light,
                  // home: LoginScreen(),
                  initialRoute: Routes.home,
                  debugShowCheckedModeBanner: false,
                  onReady: () => {},
                );
              }
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
