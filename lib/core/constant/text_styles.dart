import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class TextStyles {
//   static const buttonPrimaryText = TextStyle(
//     fontFamily: "Poppins",
//     fontWeight: FontWeight.w700,
//     fontSize: 17,
//     color: Colors.white,
//   );

//   static const authTextButton = TextStyle(
//     fontFamily: "Poppins",
//     fontWeight: FontWeight.w700,
//     fontSize: 16,
//     color: ThemeParameters.primaryColor,
//   );

//   static const appBarTextButton = TextStyle(
//     fontFamily: "Poppins",
//     fontWeight: FontWeight.w700,
//     letterSpacing: -1,
//     fontSize: 21,
//     color: ThemeParameters.primaryColor,
//   );

//   static const bodyText1 = TextStyle(
//       fontSize: 15.0,
//       fontWeight: FontWeight.w600,
//       color: Color.fromARGB(150, 97, 92, 92),
//       fontFamily: "Poppins",
//       letterSpacing: -1);

//   static const headline1 = TextStyle(
//       fontSize: 21.0,
//       fontWeight: FontWeight.w700,
//       color: Color.fromRGBO(70, 70, 70, 1),
//       fontFamily: "Poppins",
//       letterSpacing: -1);
//   static const headline6 = TextStyle(
//     fontSize: 15.0,
//     color: Colors.black,
//     fontWeight: FontWeight.w500,
//     fontFamily: "Poppins",
//   );
//   static const headline2 = TextStyle(
//       fontSize: 15.0,
//       fontFamily: "Poppins",
//       color: Color.fromRGBO(44, 93, 94, 1),
//       fontWeight: FontWeight.bold);
//   static const headlineLarge = TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 15.0,
//       color: ThemeParameters.googleUniqueColor,
//       fontWeight: FontWeight.bold);
//   static const headline3 = TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 15.0,
//       color: Color.fromARGB(70, 70, 70, 70),
//       fontWeight: FontWeight.w600);
//   static const headline4 = TextStyle(
//       fontSize: 15.0,
//       color: Color.fromARGB(255, 211, 199, 199),
//       fontWeight: FontWeight.bold);
//   static const headline5 = TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 15.0,
//       color: Colors.white,
//       fontWeight: FontWeight.w600);
//   static const subtitle2 = TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 12.0,
//       color: Colors.black,
//       fontWeight: FontWeight.bold);
//   static const subtitle1 = TextStyle(
//       fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600);
//   static const bodyText2 = TextStyle(
//     fontFamily: "Poppins",
//     fontSize: 15.0,
//     color: Color.fromARGB(255, 209, 207, 207),
//     fontWeight: FontWeight.w600,
//   );
//   static const bodyText3 = TextStyle(
//     fontFamily: "Poppins",
//     fontSize: 14.0,
//     color: Color.fromARGB(255, 209, 207, 207),
//     fontWeight: FontWeight.w500,
//   );
// }

TextStyle themeTitleLarge(BuildContext context) {
  return GoogleFonts.poppins(
      color: Theme.of(context).primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.titleLarge);
}

TextStyle themeTitleMedium(BuildContext context) {
  return GoogleFonts.poppins(
      fontSize: 20, textStyle: Theme.of(context).textTheme.titleMedium);
}

TextStyle themeTitleSmall(BuildContext context) {
  return GoogleFonts.poppins(
      fontSize: 18, textStyle: Theme.of(context).textTheme.titleSmall);
}

TextStyle themeSubtitleLarge(BuildContext context) {
  return GoogleFonts.poppins(
      fontSize: 16, textStyle: Theme.of(context).textTheme.headlineLarge);
}

TextStyle themeSubTitleMedium(BuildContext context) {
  return GoogleFonts.poppins(
      fontSize: 14, textStyle: Theme.of(context).textTheme.headlineMedium);
}

TextStyle themeSubTitleSmall(BuildContext context, {bool isLocalDark = false}) {
  return GoogleFonts.poppins(
      fontSize: 12,
      textStyle: Theme.of(context).textTheme.headlineSmall,
      color: isLocalDark
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).colorScheme.primary);
}
