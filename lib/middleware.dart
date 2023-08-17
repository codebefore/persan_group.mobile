import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/app/auth/login/user_model.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AuthController authcontroller = Get.find();
    GetStorage storage = GetStorage();
    String? userString = storage.read("user");
    String? token = storage.read("token");
    if (token == null || token.isEmpty) {
      return const RouteSettings(name: Routes.login);
    } else {
      var user = UserModel.fromJson(userString!);
      authcontroller.setUser(user);
      authcontroller.setToken(token);
      return null;
    }
  }
}

class ProductMiddleware extends GetMiddleware {
  LoaderController loadercontroller = Get.find();
  ProductController productcontroller = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    loadercontroller.setStatus(Status.loading);
    productcontroller.fetchProducts();
    loadercontroller.setStatus(Status.initial);
    return null;
  }
}
