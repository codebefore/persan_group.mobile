import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'signup': 'Kayıt Ol',
          'login': 'Giriş Yap',
          'empty_error': 'Lütfen bir değer giriniz',
          'password': 'Password',
          'enter_password': 'Lütfen şifrenizi giriniz',
          'email': 'Email',
          'enter_email': 'Lütfen emalinizi giriniz',
          'phone': 'Telefon',
          'enter_phone': 'Lütfen telefonunuzu giriniz',
          'error_phone': 'Lütfen telefonunuzu giriniz',
          'search': 'Ara ..',
          'search_hint': 'Ülke isimlerini yazabilirsin',
          'login_error': 'Girdiğiniz değerler yanlış'
        },
        'en_US': {
          'signup': 'Sign Up',
          'login': 'Login',
          'empty_error': 'Please fill in the blanks',
          'password': 'Password',
          'enter_password': 'Please enter password',
          'email': 'Email',
          'enter_email': 'Please enter email',
          'phone': 'Phone Number',
          'enter_phone': 'Please enter phone number',
          'error_phone': 'Please enter phone number',
          'search': 'Search ..',
          'search_hint': 'Start typing to search',
          'login_error': 'The values you entered are incorrect'
        },
      };
}
