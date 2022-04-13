import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class Requester {
  static const String _base_url = 'http://10.0.2.2:3001';

  // not necessary for now (?)
  static final Map<String, String> _headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };

  static Future<dynamic> getRequest(String url) async {
    try {
      final response =
          await http.get(Uri.parse(_base_url + url), headers: _headers);
      var responseData = json.decode(response.body)["success"];

      return responseData;
    } catch (e) {
      print(e);
    }
  }
}
