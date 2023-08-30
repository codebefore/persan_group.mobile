import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode phoneFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  bool obsecurePassword = true;
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final companyController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      Get.toNamed(Routes.signupmore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      body: GetBuilder<AuthController>(builder: (authcontroller) {
        return Form(
          key: _formKey,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              phoneArea,
              cityArea,
              companyArea,
              signUpButton,
              loginButton
            ],
          ),
        );
      }),
    );
  }

  BaseButton get loginButton => BaseButton(
        text: "login".tr,
        onTap: () => {Get.toNamed(Routes.login)},
        bgColor: Colors.transparent,
        textColor: Theme.of(context).colorScheme.primary,
        isInScrollView: false,
      );

  BaseButton get signUpButton => BaseButton(
        text: "continue".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  BaseInput get companyArea => BaseInput(
        controller: companyController,
        isInScrollView: true,
        onTap: () => {},
        focusNode: companyFocus,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: "company".tr,
          hintText: "enter_company".tr,
          prefixIcon: Icon(Icons.account_balance,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          companyFocus.unfocus();
          // FocusScope.of(context).requestFocus(passwordFocus);
        },
        onChanged: (String value) {
          authController.signUpModel.company = value;
          authController.setSignUpModel(authController.signUpModel);
          // companyController.text = (controller.signUpModel.phoneCode ?? "") + value;
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseInput get cityArea => BaseInput(
        controller: cityController,
        isInScrollView: true,
        onTap: () => {},
        focusNode: cityFocus,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: "city".tr,
          hintText: "enter_city".tr,
          prefixIcon: Icon(Icons.location_city,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          cityFocus.unfocus();
          FocusScope.of(context).requestFocus(companyFocus);
        },
        onChanged: (String value) {
          authController.signUpModel.city = value;
          authController.setSignUpModel(authController.signUpModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseInput get phoneArea => BaseInput(
        controller: phoneController,
        isInScrollView: true,
        onTap: () => {
          showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: screenHeight * .025,
                backgroundColor: Theme.of(context).colorScheme.background,
                textStyle: themeSubTitleSmall(context),
                bottomSheetHeight:
                    screenHeight * .5, // Optional. Country list modal height
                //Optional. Sets the border radius for the bottomsheet.
                borderRadius: ThemeParameters.borderRadius,
                //Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'search'.tr,
                  hintText: 'search_hint'.tr,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              favorite: List.from(["TR"]),
              showPhoneCode: true,
              onSelect: (Country country) => {
                    authController.signUpModel.phonecode =
                        "+${country.phoneCode}",
                    authController.signUpModel.phone = "",
                    authController.signUpModel.country = country.countryCode,
                    authController.setSignUpModel(authController.signUpModel),
                    phoneController.text = "+${country.phoneCode}"
                  })
        },
        focusNode: phoneFocus,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: "phone".tr,
          hintText: "enter_phone".tr,
          prefixIcon: Icon(Icons.phone,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          phoneFocus.unfocus();
          FocusScope.of(context).requestFocus(cityFocus);
        },
        onChanged: (String value) {
          authController.signUpModel.phone = value;
          authController.setSignUpModel(authController.signUpModel);
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
