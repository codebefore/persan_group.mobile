import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/login_model.dart';
import 'package:persangroup_mobile/app/auth/signup/signup_model.dart';
import 'package:persangroup_mobile/app/getit_binding.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';

class AuthController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();

  //loading get set
  final _loading = false.obs;
  bool get loading => _loading.value;
  void setLoading(bool b) {
    _loading.value = b;
    update();
  }

  //login get set
  final Rx<LoginModel> _loginModel = LoginModel().obs;
  LoginModel get loginModel => _loginModel.value;

  void setLoginModel(LoginModel loginModel) {
    _loginModel(loginModel);
    update();
  }

  Future<bool?> login() async {
    BaseResponse response = await _dioClient.post(Urls.login,
        data: {"Email": loginModel.phone, "sifre": loginModel.password});

    return response.success;
  }

  //signup get set
  final Rx<SignUpModel> _signUpModel = SignUpModel().obs;
  SignUpModel get signUpModel => _signUpModel.value;

  void setSignUpModel(SignUpModel signUpModel) {
    _signUpModel(signUpModel);
  }

  RxString token = ''.obs;
  bool get isAuthenticated => token.isNotEmpty;

  void logout() {
    token.value = '';
    Get.offAllNamed('/');
  }
}
