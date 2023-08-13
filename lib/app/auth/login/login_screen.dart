import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obsecurePassword = true;
  final AuthController ac = Get.find();
  @override
  void initState() {
    super.initState();
    authController.setStatus(Status.initial);
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      authController.setStatus(Status.loading);
      var isSuccess = await authController.login();
      // form?.reset();
      if (isSuccess == true) {
        authController.setStatus(Status.success);
        await Get.offAllNamed(Routes.home);
      } else {
        authController.setStatus(Status.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        body: Form(
      key: _formKey,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          emailArea,
          blank(),
          passwordArea,
          blank(),
          loginButton,
          signUpButton
        ],
      ),
    ));
  }

  BaseButton get signUpButton => BaseButton(
        text: "signup".tr,
        onTap: () => {Get.toNamed(Routes.signup)},
        bgColor: Colors.transparent,
        textColor: Theme.of(context).colorScheme.primary,
      );

  BaseInput get emailArea => BaseInput(
        focusNode: emailFocus,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
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
          authController.loginModel.username = value;
          authController.setLoginModel(authController.loginModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseButton get loginButton => BaseButton(
        text: "login".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  BaseInput get passwordArea => BaseInput(
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
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
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
        onChanged: (String value) {
          authController.loginModel.password = value;
          authController.setLoginModel(authController.loginModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );
  Container get logo => Container(
        height: screenHeight * .18,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/persanlogo.png'),
          ),
        ),
      );
}
