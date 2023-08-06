import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class DioInterceptor extends Interceptor {
  GetStorage storage = GetStorage();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // This method is called before the request is sent
    // You can modify the request options here if necessary
    if (kDebugMode) {
      print("onRequest");
    }
    var token = storage.read("token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    // This method is called after a response is received
    // You can modify the response here if necessary
    // if (response.statusCode == 401) {
    //   // Unauthorized, so refresh the access token and try again
    //   // ...
    //   handler.reject(DioException(
    //       requestOptions: response.requestOptions, response: response));
    // } else {
    handler.next(response); // Pass the response to the next interceptor
    // }
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // This method is called when an error occurs
    // You can handle the error here
    if (err.response?.statusCode == 401) {
      // Unauthorized, so refresh the access token and try again
      // ...
      // handler.next(err);
      await storage.remove('user');
      await storage.remove('token');
      Get.toNamed(Routes.login);
      // Pass the original request options to the next interceptor
    } else {
      handler.next(err); // Pass the error to the next interceptor
    }
  }
}
