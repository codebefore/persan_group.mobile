import 'package:get/get.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';

class LoaderController extends GetxController {
  //loading get set
  final _status = Status.initial.obs;
  Status get status => _status.value;
  void setStatus(Status b) {
    _status.value = b;
    update();
  }
}
