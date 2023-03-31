import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persangroup_mobile/app/auth/login/home_screen.dart';
import 'package:persangroup_mobile/app/auth/login/splash_screen.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/constant/color_schemes.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isTurk = false;
  @override
  void initState() {
    super.initState();
  }

  void changeLanguage(isTurk) {
    setState(() {
      this.isTurk = isTurk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColorScheme.background,
      body: Scaffold(
        body: Container(
          decoration: imageBackground(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18, right: 18, top: 100, bottom: 40),
            child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWelcome(),
                  textPersanGroup(context),
                  buttonsSignupLogin(context),
                ]),
          ),
        ),
      ),
    );
  }

  BoxDecoration imageBackground() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/images/start_background.png"),
            fit: BoxFit.cover));
  }

  Column buttonsSignupLogin(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseButton(
              bgColor: darkColorScheme.primary,
              textColor: darkColorScheme.background,
              text: "signup".tr,
              onTap: () => {
                Get.to(HomeScreen())
                // Get.changeTheme(ThemeData.from(colorScheme: lightColorScheme))
              },
            ),
            BaseButton(
              text: "Login",
              onTap: () => {
                // Get.bottomSheet(Container(
                //   color: Colors.red,
                // ))
                // if (isTurk == true)
                //   {
                //     Get.updateLocale(const Locale('en', 'EN')),
                //     changeLanguage(false)
                //   }
                // else
                //   {
                //     Get.updateLocale(const Locale('tr', 'TR')),
                //     changeLanguage(true)
                //   }
                // Get.to(SplashScreen())
                // Get.changeTheme(ThemeData.from(colorScheme: darkColorScheme))
              },
              bgColor: Colors.transparent,
              textColor: darkColorScheme.primary,
              border: Border.all(color: darkColorScheme.primary),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .03,
        ),
        Text(
          "TENTE PERGOLA SAN VE TİC LTD ŞTİ",
          style: themeSubTitleSmall(context, isLocalDark: true),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Column textPersanGroup(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("PERSAN",
            style: GoogleFonts.poppins(
                color: lightColorScheme.background,
                fontSize: 80,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                height: 1,
                textStyle: Theme.of(context).textTheme.titleLarge)),
        Text("GROUP",
            style: GoogleFonts.poppins(
                color: const Color(0xFFBBBBBB),
                fontSize: 80,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                height: 1,
                textStyle: Theme.of(context).textTheme.titleLarge)),
      ],
    );
  }

  Text textWelcome() {
    return Text("Welcome to",
        style: TextStyle(
            color: darkColorScheme.primary,
            fontSize: 25,
            letterSpacing: 3,
            fontWeight: FontWeight.w200));
  }
}
