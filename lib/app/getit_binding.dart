import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> singleton() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  // getIt.registerSingleton(AuthService(dioClient: getIt<DioClient>()));
  // getIt.registerSingleton(CheckPointService(dioClient: getIt<DioClient>()));
}
