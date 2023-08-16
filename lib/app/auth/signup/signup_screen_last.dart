import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';

class SignUpScreenLast extends StatefulWidget {
  const SignUpScreenLast({super.key});

  @override
  State<SignUpScreenLast> createState() => _SignUpScreenLastState();
}

class _SignUpScreenLastState extends State<SignUpScreenLast> {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  bool obsecurePassword = true;
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      // await authController.signUp();
    }
  }

  List<DropdownMenuItem<String>> get dropdownCurrency {
    List<DropdownMenuItem<String>> currencyItems = [
      const DropdownMenuItem(value: "TL", child: Text("TL")),
      const DropdownMenuItem(value: "USD", child: Text("USD")),
      const DropdownMenuItem(value: "EURO", child: Text("EURO")),
    ];
    return currencyItems;
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
              passwordArea,
              DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: ThemeParameters.borderRadius),
                    labelText: "currency".tr,
                    hintText: "select_currency".tr,
                    prefixIcon: Icon(Icons.currency_lira,
                        size: iconSize, color: Theme.of(context).primaryColor)),
                borderRadius: BorderRadius.circular(18.0),
                isExpanded: true,
                elevation: 2,
                // value: authController.signUpModel.currency,
                items: dropdownCurrency,
                onChanged: (Object? value) {
                  // authController.signUpModel.currency = value.toString();
                  // authController.setSignUpModel(authcontroller.signUpModel);
                },
              ),
              blank(),
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
        text: "signup".tr,
        onTap: validateAndSave,
        width: screenWidth,
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
