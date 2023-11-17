class Urls {
  static String baseUrl = 'https://persan.pestomat.com/api';
  static String login = '$baseUrl/token/';
  static String refresh = '$baseUrl/token/refresh/';
  static String profile = '$baseUrl/customer/';
  static String register = '$baseUrl/customer/';
  static String products = '$baseUrl/product/';
  static String categories = '$baseUrl/category/';
  static String createoffer = '$baseUrl/offer/';
  static String userdelete = '$baseUrl/user/account_delete/';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
