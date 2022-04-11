import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

abstract class BaseAPI {
  static const String _adress = "http://172.16.120.21:3001";

  static final Uri _apiM2L = Uri.http(_adress, '/api');
  static final Uri _loginPath = Uri.http(_adress, '/users/login');
  static final Uri _logoutPath = Uri.http(_adress, '/users/logout');

  static final Map<String, String> _headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };

  static Future<dynamic> api() async {
    try {
      final response = await http.get(_apiM2L, headers: _headers);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);
        return result['success'];
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> login() async {
    try {} catch (e) {
      print(e);
    }
    _loginPath;
  }
}
