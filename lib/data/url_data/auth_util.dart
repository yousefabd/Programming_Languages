String url = 'http://10.0.2.2:8000/api/';
List<String> languages = ['English ', ' العربية'];

class AuthUtility {
  static String? _token;
  static void setToken(String t) {
    _token = t;
  }

  static String? getToken() {
    return _token;
  }
}
