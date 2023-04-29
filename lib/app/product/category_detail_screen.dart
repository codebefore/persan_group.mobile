import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode widthFocus = FocusNode();
  FocusNode width2Focus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      await authController.login();
      form?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
        ),
        body: BaseWidget(
          isDark: true,
          noNeedPadding: true,
          body: GetBuilder<AuthController>(builder: (authcontroller) {
            return Flex(
              direction: Axis.vertical,
              children: [start],
            );
          }),
        ));
  }

  Container get start => Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/start_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * .1,
            ),
            logo,
            Container(
                height: screenHeight * .7,
                width: screenWidth * .95,
                decoration: BoxDecoration(
                    borderRadius: ThemeParameters.borderRadius,
                    color: Theme.of(context).colorScheme.background),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widthArea,
                        blank(),
                        widthArea,
                        blank(),
                        loginButton,
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );
  BaseInput get widthArea => BaseInput(
        focusNode: widthFocus,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: 'width'.tr,
          // hintText: 'enter_email'.tr,
          prefixIcon: Icon(Icons.calculate,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          widthFocus.unfocus();
          FocusScope.of(context).requestFocus(width2Focus);
        },
        onChanged: (String value) {
          authController.loginModel.phone = value;
          authController.setLoginModel(authController.loginModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseButton get loginButton => BaseButton(
        text: "getprice".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  Container get logo => Container(
        width: screenWidth,
        height: screenHeight * .15,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/logo_dark.png'),
          ),
        ),
      );
}
