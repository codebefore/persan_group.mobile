// class Urls {
//   static String baseUrl = 'http://api.persangroup.com.tr/PERSAN';
//   static String login = '$baseUrl/signin.php';
//   static String signUp = '$baseUrl/create.php';
// }

class Urls {
  static String baseUrl = 'http://185.81.152.101:8080';
  static String login = '$baseUrl/api/token/';
  static String profile = '$baseUrl/api/customer/';
  static String register = '$baseUrl/api/customer/';
  static String products = '$baseUrl/api/product/';
  static String createoffer = '$baseUrl/api/offer/';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
