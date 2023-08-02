class DioExceptions implements Exception {
//   late BaseResponse response = BaseResponse();

//   DioExceptions.fromDioError(dioError) {
//     switch (dioError.type) {
  // case DioErrorType.cancel:
  //   response = response.copyWith(
  //       redirectRefreshToken: false,
  //       message: 'Request to API server was cancelled',
  //       success: false,
  //       count: 0,
  //       statusCode: 404,
  //       data: null);
  //   break;
  // case DioErrorType.connectionTimeout:
  //   response = response.copyWith(
  //       redirectRefreshToken: false,
  //       message: 'Connection timeout with API server',
  //       success: false,
  //       count: 0,
  //       statusCode: 404,
  //       data: null);
  //   break;
  // case DioErrorType.receiveTimeout:
  //   response = response.copyWith(
  //       redirectRefreshToken: false,
  //       message: 'Receive timeout in connection with API server',
  //       success: false,
  //       count: 0,
  //       statusCode: 404,
  //       data: null);
  //   break;
  //     case DioErrorType.badResponse:
  //       var serverResponse = BaseResponse();
  //       if (dioError.response?.data != null) {
  //         try {
  //           serverResponse = BaseResponse.fromJson(dioError.response?.data);
  //         } catch (e) {
  //           serverResponse = response.copyWith(
  //               count: 0,
  //               success: false,
  //               message: e.toString(),
  //               statusCode: dioError.response?.statusCode);
  //         }
  //       }

  //       var tokenExpired = dioError.response?.headers.value('token-expired');

  //       response = response.copyWith(
  //           message: _handleError(
  //             dioError.response?.statusCode,
  //             serverResponse.message,
  //           ),
  //           statusCode: dioError.response?.statusCode,
  //           redirectRefreshToken: tokenExpired == "true",
  //           success: false,
  //           count: 0,
  //           data: null);
  //       break;
  //     case DioErrorType.sendTimeout:
  //       response = BaseResponse(
  //           message: 'Send timeout in connection with API server',
  //           success: false,
  //           count: 0,
  //           data: null);
  //       break;
  //     default:
  //       response = response.copyWith(
  //           message: 'Something went wrong',
  //           success: false,
  //           count: 0,
  //           data: null);
  //       break;
  //   }
  // }

  // String _handleError(int? statusCode, String? message) {
  //   switch (statusCode) {
  //     case 400:
  //       return message ?? 'Bad request';
  //     case 401:
  //       return message ?? 'UnAuthorized';
  //     case 403:
  //       return message ?? 'Forbidden';
  //     case 404:
  //       return message ?? 'NotFound';
  //     case 500:
  //       return message ?? 'Internal server error';
  //     case 502:
  //       return message ?? 'Bad gateway';
  //     default:
  //       return message ?? 'Oops something went wrong';
  //   }
  // }
}
