import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/auth/login/login_request_model.dart';
import 'package:persangroup_mobile/app/auth/login/token_model.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_model.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';

import 'login/user_model.dart';

class AuthController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();
  GetStorage storage = GetStorage();

  //login get set
  final Rx<LoginRequestModel> _loginModel = LoginRequestModel().obs;
  LoginRequestModel get loginModel => _loginModel.value;

  void setLoginModel(LoginRequestModel loginModel) {
    _loginModel.value = loginModel;
  }

  //signup get set
  final Rx<SignUpModel> _signUpModel = SignUpModel().obs;
  SignUpModel get signUpModel => _signUpModel.value;

  void setSignUpModel(SignUpModel signUpModel) {
    _signUpModel.value = signUpModel;
  }

//user get set
  final _user = UserModel().obs;
  UserModel get user => _user.value;
  void setUser(UserModel b) {
    _user.value = b;
  }

  final _token = ''.obs;
  void setToken(String token) {
    _token.value = token;
  }

  bool get isAuthenticated => _token.isNotEmpty;

  Future logout() async {
    setToken('');
    await storage.remove('user');
    await storage.remove('token');
  }

  Future<bool> userDelete() async {
    BaseResponse response = await _dioClient.get(Urls.userdelete);
    if (response.success == true) {
      return true;
    }
    return false;
  }

  Future<bool> login() async {
    var data = loginModel.toJson();
    BaseResponse response = await _dioClient.post(Urls.login, data: data);
    if (response.success == true) {
      TokenModel loginResponseModel = TokenModel.fromMap(response.data);
      setToken(loginResponseModel.access ?? '');
      await storage.write("token", loginResponseModel.access);
      var profilersponse = await getProfile();
      return profilersponse;
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

  Future<bool> register() async {
    signUpModel.username = signUpModel.email;
    var data = signUpModel.toJson();
    BaseResponse response = await _dioClient.post(Urls.register, data: data);
    if (response.success == true) {
      Get.snackbar("Success", "success".tr,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.error, color: Colors.green),
          overlayColor: Colors.black,
          colorText: Colors.green);
      return true;
    }
    return false;
  }
}
