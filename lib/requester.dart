// tuto au gout du jour:
// https://www.geeksforgeeks.org/http-get-response-in-flutter/
// https://stackoverflow.com/questions/54849725/bad-state-cannot-set-the-body-fields-of-a-request-with-content-type-applicatio

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
      if (response.statusCode == 200) {
        return json.decode(response.body)["success"];
      } else {
        return Future.error('erreur serveur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<dynamic> postRequest(String url, var reqBody) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    try {
      final response = await http.post(Uri.parse(_base_url + url),
          headers: requestHeaders, body: jsonEncode(reqBody));
      if (response.statusCode == 200) {
        return json.decode(response.body)["success"];
      } else {
        return Future.error('erreur serveur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}