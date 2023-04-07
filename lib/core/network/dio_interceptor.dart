import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // This method is called before the request is sent
    // You can modify the request options here if necessary
    if (kDebugMode) {
      print("onRequest");
    }
    options.headers["Authorization"] = "Bearer your-access-token";
    handler.next(options); // Pass the modified options to the next interceptor
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // This method is called after a response is received
    // You can modify the response here if necessary
    if (response.statusCode == 401) {
      // Unauthorized, so refresh the access token and try again
      // ...
      handler.reject(DioError(
          requestOptions: response.requestOptions, response: response));
    } else {
      handler.next(response); // Pass the response to the next interceptor
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // This method is called when an error occurs
    // You can handle the error here
    if (err.response?.statusCode == 401) {
      // Unauthorized, so refresh the access token and try again
      // ...
      handler.next(
          err); // Pass the original request options to the next interceptor
    } else {
      handler.next(err); // Pass the error to the next interceptor
    }
  }
}
