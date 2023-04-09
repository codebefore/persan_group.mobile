import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_exception.dart';
import 'package:persangroup_mobile/core/network/dio_interceptor.dart';

import 'network.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Urls.baseUrl
      ..options.connectTimeout = NetworkSettings.connectionTimeout
      ..options.receiveTimeout = NetworkSettings.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    _dio.interceptors.add(DioInterceptor());
  }

  Future<BaseResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      var baseResponse = BaseResponse();
      if (response.statusCode == 200 || response.statusCode == 201) {
        baseResponse.copyWith(statusCode: 200, data: response.data);
        return baseResponse;
      } else if (response.statusCode == 401) {
        return baseResponse.copyWith(
            message: response.data,
            success: false,
            redirectRefreshToken: true,
            statusCode: response.statusCode);
      } else {
        return BaseResponse(
            message: response.data,
            success: false,
            statusCode: response.statusCode);
      }
    } on DioError catch (error) {
      final errorResponse = DioExceptions.fromDioError(error);
      return errorResponse.response;
    }
  }

  Future<BaseResponse> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      var baseResponse = BaseResponse();
      if (response.statusCode == 200 || response.statusCode == 201) {
        baseResponse =
            BaseResponse(statusCode: 200, success: true, data: response.data);
        return baseResponse;
      } else {
        return baseResponse.copyWith(
            message: response.statusMessage,
            success: false,
            statusCode: response.statusCode);
      }
    } on DioError catch (error) {
      final errorResponse = DioExceptions.fromDioError(error);
      return errorResponse.response;
    }
  }

  Future<BaseResponse> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      var baseResponse = BaseResponse();
      if (response.statusCode == 200 || response.statusCode == 201) {
        baseResponse = BaseResponse.fromJson(response.data);
        baseResponse.copyWith(statusCode: 200);
        return baseResponse;
      } else {
        return baseResponse.copyWith(
            message: response.statusMessage,
            success: false,
            statusCode: response.statusCode);
      }
    } on DioError catch (error) {
      final errorResponse = DioExceptions.fromDioError(error);
      return errorResponse.response;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      var baseResponse = BaseResponse();
      if (response.statusCode == 200 || response.statusCode == 201) {
        baseResponse = BaseResponse.fromJson(response.data);
        baseResponse.copyWith(statusCode: 200);
      } else {
        return baseResponse.copyWith(
            message: response.statusMessage,
            success: false,
            statusCode: response.statusCode);
      }
    } on DioError catch (error) {
      final errorResponse = DioExceptions.fromDioError(error);
      return errorResponse.response;
    }
  }
}
