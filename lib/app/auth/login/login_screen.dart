import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_screen.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import '../../../core/component/base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obsecurePassword = true;
  // String email = "";
  // final dio = Dio();
  @override
  void initState() {
    super.initState();
  }

  // void changeEmail(text) {
  //   setState(() {
  //     email = text;
  //   });
  // }

  // void getHttp() async {
  //   await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Login"),
        // ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.red,
        body: baseScreen(
          context: context,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              Column(
                children: [
                  phoneArea(context),
                  blank(),
                  passwordArea(context),
                  blank(),
                ],
              ),
              loginButton(),
              BaseButton(
                text: "signup".tr,
                onTap: () => {Get.to(const SignUpScreen())},
                bgColor: Colors.transparent,
                textColor: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ));
  }

  BaseButton loginButton() {
    return BaseButton(
      text: "login".tr,
      onTap: () => {},
      width: screenWidth,
    );
  }

  BaseInput passwordArea(BuildContext context) {
    return BaseInput(
      focusNode: passwordFocus,
      obsecure: obsecurePassword,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obsecurePassword = !obsecurePassword;
              });
            },
            child: obsecurePassword == true
                ? Icon(
                    Icons.visibility_off_sharp,
                    color: Theme.of(context).primaryColor,
                    size: iconSize,
                  )
                : Icon(
                    Icons.visibility,
                    color: Theme.of(context).primaryColor,
                    size: iconSize,
                  )),
        border: OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
        labelText: "password".tr,
        hintText: "enter_password".tr,
        prefixIcon: Icon(Icons.lock,
            size: iconSize, color: Theme.of(context).primaryColor),
      ),
      keyboardType: TextInputType.text,
      textFormatters: const [],
      textInputAction: TextInputAction.done,
      onEditingComplete: () {
        passwordFocus.unfocus();
      },
      onChanged: (String value) {},
      validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
    );
  }

  BaseInput phoneArea(BuildContext context) {
    return BaseInput(
      // controller: emailController,
      // containerWidth: screenWidth,
      focusNode: emailFocus,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
        labelText: 'email'.tr,
        hintText: 'enter_email'.tr,
        prefixIcon: Icon(Icons.person,
            size: iconSize, color: Theme.of(context).primaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      textFormatters: const [],
      onEditingComplete: () {
        emailFocus.unfocus();
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      onChanged: (String value) {
        // authBloc.add(LoginInputChanged(email: value));
      },
      validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
    );
  }

  Container logo() {
    return Container(
      height: screenHeight * .2,
      width: screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/persanlogo.png'),
        ),
      ),
    );
  }
}
