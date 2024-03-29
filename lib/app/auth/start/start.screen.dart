import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persangroup_mobile/app/auth/login/login_screen.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen.dart';
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
  @override
  void initState() {
    super.initState();
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
            image: AssetImage("lib/assets/images/start_background.jpg"),
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
              onTap: () => {Get.to(const SignUpScreen())},
            ),
            BaseButton(
              text: "login".tr,
              onTap: () => {Get.to(const LoginScreen())},
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
            letterSpacing: 2,
            fontWeight: FontWeight.w200));
  }
}
