import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  Future<void> dependencies() async {
    await Get.putAsync(() async => AuthController(), permanent: true);
  }
}
