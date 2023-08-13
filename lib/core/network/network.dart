class Urls {
  static String baseUrl = 'http://185.81.152.101:8080/api';
  static String login = '$baseUrl/token/';
  static String refresh = '$baseUrl/token/refresh/';
  static String profile = '$baseUrl/customer/';
  static String register = '$baseUrl/customer/';
  static String products = '$baseUrl/product/';
  static String createoffer = '$baseUrl/offer/';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
