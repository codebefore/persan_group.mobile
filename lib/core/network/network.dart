class Urls {
  static String baseUrl = 'http://api.persangroup.com.tr/PERSAN';
  static String login = '$baseUrl/signin.php';
  static String signUp = '$baseUrl/create.php';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
