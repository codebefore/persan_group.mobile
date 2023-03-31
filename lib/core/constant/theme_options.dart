import 'package:flutter/material.dart';

class ThemeColors {
  final Color primaryColor = const Color.fromRGBO(44, 93, 94, 1);
}

class ThemeOptions {
  final bool isDark = false;

  ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(44, 93, 94, 1),
    hintColor: const Color.fromRGBO(70, 70, 70, 1),
    iconTheme: const IconThemeData(color: ThemeParameters.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              color: ThemeParameters.primaryColor, width: 1.1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ThemeParameters.primaryColor,
            width: 2,
          )),
    ),
    drawerTheme:
        const DrawerThemeData(backgroundColor: Colors.white, width: 250),
    appBarTheme: const AppBarTheme(
        backgroundColor: ThemeParameters.backgroundPrimary,
        actionsIconTheme: IconThemeData(color: ThemeParameters.primaryColor)),
    checkboxTheme: CheckboxThemeData(
        splashRadius: 12,
        fillColor: MaterialStateProperty.all(Colors.black45),
        overlayColor: MaterialStateProperty.all(Colors.black45)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(150, 97, 92, 92),
          letterSpacing: -1),
      displayLarge: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(70, 70, 70, 1),
          letterSpacing: -1),
      titleLarge: TextStyle(
          fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontSize: 15.0,
          color: Color.fromRGBO(44, 93, 94, 1),
          fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(
          fontSize: 15.0,
          color: ThemeParameters.googleUniqueColor,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(70, 70, 70, 70),
          fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(255, 211, 199, 199),
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
        fontSize: 15.0,
        color: Color.fromARGB(255, 209, 207, 207),
        fontWeight: FontWeight.w600,
      ),
    ),
    // colorScheme: ColorScheme(
    //     onBackground: Colors.white,
    //     background: Colors.white,
    //     brightness: Brightness.light),
  );

  ThemeData darkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(44, 93, 94, .1),
    primaryColorDark: const Color.fromRGBO(44, 93, 94, 150),
    hintColor: const Color.fromRGBO(70, 70, 70, 1),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -1),
      displayMedium: TextStyle(
          fontSize: 14.0,
          color: Color.fromRGBO(44, 93, 94, 1),
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          fontSize: 15.0, color: Colors.white38, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // colorScheme: ColorScheme(background: const Color.fromARGB(255, 1, 1, 1)),
  );
}

class ThemeParameters {
  static const double borderRadiusValue = 16;
  static const Radius radiusCircular = Radius.circular(borderRadiusValue);
  static BorderRadiusGeometry borderRadius =
      BorderRadius.circular(borderRadiusValue);
  static const ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: radiusCircular,
    topRight: radiusCircular,
  ));
  static const Color primaryColorDark = Color.fromRGBO(44, 93, 94, 0.1);
  static const Color facebookUniqueColor = Color(0xFF4267B2);
  static const Color googleUniqueColor = Color(0xFFDB4437);
  static const Color primaryColor = Color.fromRGBO(44, 93, 94, 1);
  static const Color fieldGreyColor = Color(0xFFF5F5F5);
  static const Color fieldWhiteColor = Color(0xFFFAFAFA);
  static const Color buttonAlternative = Color(0xFFDE1800);
  static const Color backgroundPrimary = Color(0xFFFfffff);
}
