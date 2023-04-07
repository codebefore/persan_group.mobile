import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/login/login_screen.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/component/scaffold_widget.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  bool obsecurePassword = true;
  final phoneController = TextEditingController();
  // final dio = Dio();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: GetBuilder<AuthController>(builder: (authcontroller) {
        return Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            phoneArea(context, authcontroller),
            blank(),
            signUpButton(),
            BaseButton(
              text: "login".tr,
              onTap: () => {Get.to(const LoginScreen())},
              bgColor: Colors.transparent,
              textColor: Theme.of(context).colorScheme.primary,
              isInScrollView: false,
            )
          ],
        );
      }),
    );
  }

  BaseButton signUpButton() {
    return BaseButton(
      text: "signup".tr,
      onTap: () => {},
      width: screenWidth,
    );
  }

  BaseInput phoneArea(BuildContext context, AuthController controller) {
    return BaseInput(
      controller: phoneController,
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
                  controller.signUpModel.phoneCode = "+${country.phoneCode}",
                  controller.signUpModel.phone = "",
                  controller.signUpModel.country =
                      country.displayNameNoCountryCode,
                  controller.setSignUpModel(controller.signUpModel),
                  phoneController.text = "+${country.phoneCode}"
                })
      },
      focusNode: phoneFocus,
      maxLength: 10,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
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
        // FocusScope.of(context).requestFocus(passwordFocus);
      },
      onChanged: (String value) {
        controller.signUpModel.phone = value;
        controller.setSignUpModel(controller.signUpModel);
        // phoneController.text = (controller.signUpModel.phoneCode ?? "") + value;
      },
      validator: (value) => (value ?? '').isEmpty ? "error_phone".tr : null,
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
