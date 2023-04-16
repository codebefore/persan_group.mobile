import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/login_model.dart';
import 'package:persangroup_mobile/app/auth/login/login_response_model.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_model.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
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
        setStatus(Status.success);
        Get.toNamed(Routes.signup);
        return true;
      }
    }
    setStatus(Status.error);
    return false;
  }

  //signup get set
  final Rx<SignUpModel> _signUpModel = SignUpModel().obs;
  SignUpModel get signUpModel => _signUpModel.value;

  void setSignUpModel(SignUpModel signUpModel) {
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
