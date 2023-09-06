import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class SignUpScreenMore extends StatefulWidget {
  const SignUpScreenMore({super.key});

  @override
  State<SignUpScreenMore> createState() => _SignUpScreenMoreState();
}

class _SignUpScreenMoreState extends State<SignUpScreenMore> {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obsecurePassword = true;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      Get.toNamed(Routes.signuplast);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // appBar: AppBar(
      //   title: Text(""),
      // ),
      body: GetBuilder<AuthController>(builder: (authcontroller) {
        return Form(
          key: _formKey,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              emailArea,
              firstNameArea,
              lastNameArea,
              // passwordArea,
              signUpButton,
              backButton
            ],
          ),
        );
      }),
    );
  }

  BaseButton get backButton => BaseButton(
        text: "back".tr,
        onTap: () => {Get.back()},
        bgColor: Colors.transparent,
        textColor: Theme.of(context).colorScheme.primary,
        isInScrollView: false,
      );

  BaseButton get signUpButton => BaseButton(
        text: "continue".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  BaseInput get lastNameArea => BaseInput(
        controller: lastNameController,
        isInScrollView: true,
        onTap: () => {},
        focusNode: lastNameFocus,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: "last_name".tr,
          hintText: "enter_last_name".tr,
          prefixIcon: Icon(Icons.account_circle,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          lastNameFocus.unfocus();
          // FocusScope.of(context).requestFocus(emailFocus);\
        },
        onChanged: (String value) {
          authController.signUpModel.last_name = value;
          authController.setSignUpModel(authController.signUpModel);
          // phoneController.text = (controller.signUpModel.phoneCode ?? "") + value;
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseInput get firstNameArea => BaseInput(
        controller: firstNameController,
        isInScrollView: true,
        focusNode: firstNameFocus,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: "first_name".tr,
          hintText: "enter_first_name".tr,
          prefixIcon: Icon(Icons.account_circle,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          firstNameFocus.unfocus();
          FocusScope.of(context).requestFocus(lastNameFocus);
        },
        onChanged: (String value) {
          authController.signUpModel.first_name = value;
          authController.setSignUpModel(authController.signUpModel);
          // phoneController.text = (controller.signUpModel.phoneCode ?? "") + value;
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );
  BaseInput get emailArea => BaseInput(
        focusNode: emailFocus,
        isInScrollView: true,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: 'email'.tr,
          hintText: 'enter_email'.tr,
          prefixIcon: Icon(Icons.email_rounded,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          emailFocus.unfocus();
          FocusScope.of(context).requestFocus(firstNameFocus);
        },
        onChanged: (String value) {
          authController.signUpModel.email = value;
          authController.setSignUpModel(authController.signUpModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );
  BaseInput get passwordArea => BaseInput(
        focusNode: passwordFocus,
        isInScrollView: true,
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
          // authController.signUpModel.password = value;
          // authController.setSignUpModel(authController.signUpModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  Container get logo => Container(
        height: screenHeight * .2,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/persanlogo.png'),
          ),
        ),
      );
}
