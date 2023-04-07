class Urls {
  static String baseUrl = 'https://jsonplaceholder.typicode.com/photos';
  static String list = 'https://jsonplaceholder.typicode.com/photos';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
