class AuthUtility {
  static String? token;
  static void setToken(String t) {
    token = t;
  }

  static String? getToken() {
    return token;
  }
}
