import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/auth/login/login_request_model.dart';
import 'package:persangroup_mobile/app/auth/login/token_model.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_model.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

import 'login/user_model.dart';

class AuthController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();
  GetStorage storage = GetStorage();
  //loading get set
  final _status = Status.initial.obs;
  Status get status => _status.value;
  void setStatus(Status b) {
    _status.value = b;
    update();
  }

  @override
  void onReady() {
    _token.value = storage.read('token');
    update();
    super.onReady();
  }

  //login get set
  final Rx<LoginRequestModel> _loginModel = LoginRequestModel().obs;
  LoginRequestModel get loginModel => _loginModel.value;

  void setLoginModel(LoginRequestModel loginModel) {
    _loginModel.value = loginModel;
    update();
  }

//user get set
  final _user = UserModel().obs;
  UserModel get user => _user.value;
  void setUser(UserModel b) {
    _user.value = b;
    update();
  }

  final _token = ''.obs;
  Future setToken(String token) async {
    _token.value = token;
    if (token.isEmpty) {
      await storage.remove('token');
    } else {
      await storage.write('token', token);
    }
  }

  bool get isAuthenticated => _token.isNotEmpty;

  Future logout() async {
    await setToken('');
    await storage.remove('user');
    await Get.toNamed(Routes.login);
  }

  Future<bool> login() async {
    BaseResponse response =
        await _dioClient.post(Urls.login, data: loginModel.toJson());
    if (response.success == true) {
      TokenModel loginResponseModel = TokenModel.fromMap(response.data);
      setToken(loginResponseModel.access ?? '');
      await storage.write("token", loginResponseModel.access);
      return await getProfile();
    } else {
      Get.snackbar("Error", "checkyourcredentials".tr,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10),
          icon: const Icon(Icons.error, color: Colors.red),
          overlayColor: Colors.black,
          colorText: Colors.red);
    }
    return false;
  }

  Future<bool> getProfile() async {
    BaseResponse response = await _dioClient.get(Urls.profile);
    if (response.success == true) {
      UserModel loginResponseModel = UserModel.fromMap(response.data[0]);
      setUser(loginResponseModel);
      await storage.write("user", loginResponseModel.toJson().toString());
      return true;
    }
    return false;
  }

  Future<bool> signUp() async {
    setStatus(Status.loading);
    BaseResponse response = await _dioClient.post(Urls.register, data: {
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
    if (response.success == true && response.data != null) {
      // var signUpResponse = UserModel.fromJson(response.data);
      setStatus(Status.initial);
      Get.dialog(
        AlertDialog(
          title: Text("congratulations".tr),
          content: Text("your_registration_has_been_successfully_completed".tr),
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
    setStatus(Status.initial);
    _signUpModel.value = signUpModel;
  }
}
