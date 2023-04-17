import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/component/scaffold_widget.dart';
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
  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      await authController.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authcontroller) {
      return ScaffoldWidget(
          body: Form(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            emailArea(authcontroller, context),
            blank(),
            passwordArea(
              authcontroller,
              context,
            ),
            blank(),
            loginButton(authcontroller),
            signUpButton(context, authcontroller),
            // authController.status == Status.error
            //     ? BaseText(
            //         "login_error".tr,
            //         textColor: Theme.of(context).colorScheme.error,
            //         style: themeSubTitleSmall(context),
            //       )
            //     : const Text("")
          ],
        ),
      ));
    });
  }

  BaseButton signUpButton(BuildContext context, AuthController controller) {
    return BaseButton(
      text: "signup".tr,
      onTap: () => {Get.toNamed(Routes.signup)},
      bgColor: Colors.transparent,
      textColor: Theme.of(context).colorScheme.primary,
    );
  }

  BaseInput emailArea(AuthController controller, BuildContext context) {
    return BaseInput(
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
        controller.loginModel.phone = value;
        controller.setLoginModel(controller.loginModel);
      },
      validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
    );
  }

  BaseButton loginButton(AuthController authcontroller) {
    return BaseButton(
      text: "login".tr,
      onTap: validateAndSave,
      width: screenWidth,
    );
  }

  BaseInput passwordArea(AuthController controller, BuildContext context) {
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
      onChanged: (String value) {
        controller.loginModel.password = value;
        controller.setLoginModel(controller.loginModel);
      },
      validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
    );
  }

  Container logo() {
    return Container(
      height: screenHeight * .18,
      width: screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/persanlogo.png'),
        ),
      ),
    );
  }
}
