import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/login_model.dart';
import 'package:persangroup_mobile/app/auth/login/login_response_model.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_model.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';
import 'package:persangroup_mobile/core/functions/toast.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class AuthController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();

  //loading get set
  final _status = Status.initial.obs;
  Status get status => _status.value;
  void setStatus(Status b) {
    _status.value = b;
    update();
  }

  //login get set
  final Rx<LoginModel> _loginModel = LoginModel().obs;
  LoginModel get loginModel => _loginModel.value;

  void setLoginModel(LoginModel loginModel) {
    setStatus(Status.initial);
    _loginModel(loginModel);
    update();
  }

  Future<bool> login() async {
    setStatus(Status.loading);
    BaseResponse response = await _dioClient.post(Urls.login,
        data: {"Email": loginModel.phone, "sifre": loginModel.password});
    if (response.success == true && response.data != null) {
      var loginResponse = LoginResponseModel.fromJson(response.data);
      if (loginResponse.status == "Success") {
        setStatus(Status.initial);
        Get.toNamed(Routes.home);
        return true;
      }
    }
    // Get.snackbar("Error", "login_error".tr,
    //     snackPosition: SnackPosition.BOTTOM,
    //     icon: const Icon(Icons.error, color: Colors.red),
    //     overlayColor: Colors.black,
    //     colorText: Colors.red);
    getToast(content: "login_error".tr);
    setStatus(Status.error);
    return false;
  }

  Future<bool> signUp() async {
    setStatus(Status.loading);
    BaseResponse response = await _dioClient.post(Urls.signUp, data: {
      "Name": signUpModel.name,
      "sifre": signUpModel.password,
      "Number": signUpModel.phone,
      "Email": signUpModel.email,
      "Update": "no",
      "Company": signUpModel.company,
      "City": signUpModel.city,
      "Country": signUpModel.country,
      "SoyIsim": signUpModel.lastName,
      "Currency": signUpModel.currency
    });
    if (response.success == true &&
        response.data != null &&
        response.data != "idiot") {
      var signUpResponse = LoginResponseModel.fromJson(response.data);
      if (signUpResponse.status == "Success") {
        setStatus(Status.initial);
        Get.dialog(
          AlertDialog(
            title: Text("congratulations".tr),
            content:
                Text("your_registration_has_been_successfully_completed".tr),
            backgroundColor: Colors.white,
            // titleTextStyle: themeTitleLarge(context),
            actions: [
              BaseButton(
                height: screenHeight * .04,
                width: screenWidth * .2,
                // style: themeSubTitleMedium(context),
                text: "OK",
                onTap: () => Get.toNamed(Routes.login),
              ),
            ],
          ),
          barrierDismissible: false,
        );

        return true;
      } else {
        setStatus(Status.error);
        Get.dialog(
          AlertDialog(
            title: const Text("Error"),
            content: Text("something_wrong_please_try_again".tr),
            backgroundColor: Colors.white,
            // titleTextStyle: themeTitleLarge(context),
            actions: [
              BaseButton(
                height: screenHeight * .04,
                width: screenWidth * .2,
                // style: themeSubTitleMedium(context),
                text: "OK",
                onTap: () => Get.toNamed(Routes.signup),
              ),
            ],
          ),
          barrierDismissible: false,
        );

        return false;
      }
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: Text("something_wrong_please_try_again".tr),
          backgroundColor: Colors.white,
          // titleTextStyle: themeTitleLarge(context),
          actions: [
            BaseButton(
              height: screenHeight * .04,
              width: screenWidth * .2,
              // style: themeSubTitleMedium(context),
              text: "OK",
              onTap: () => Get.toNamed(Routes.signup),
            ),
          ],
        ),
        barrierDismissible: false,
      );

      setStatus(Status.error);
      return false;
    }
  }

  //signup get set
  final Rx<SignUpModel> _signUpModel = SignUpModel().obs;
  SignUpModel get signUpModel => _signUpModel.value;

  void setSignUpModel(SignUpModel signUpModel) {
    print(signUpModel.toString());
    setStatus(Status.initial);
    _signUpModel(signUpModel);
  }

  RxString token = ''.obs;
  bool get isAuthenticated => token.isNotEmpty;

  void logout() {
    token.value = '';
    Get.offAllNamed('/');
  }
}
