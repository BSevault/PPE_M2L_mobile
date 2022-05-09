// tuto au gout du jour:
// https://www.geeksforgeeks.org/http-get-response-in-flutter/
// https://stackoverflow.com/questions/54849725/bad-state-cannot-set-the-body-fields-of-a-request-with-content-type-applicatio

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class Requester {
  // ip aws
  // static const String _base_url = 'http://15.237.109.149:3001';

  // back ovh
  // static const String _base_url = 'https://groupe-a-ben.lemonravioli.ovh';

  // ip localhost vm android
  // static const String _base_url = 'http://10.0.2.2:3001';
  // ip VM Gefor PC1
  // static const String _base_url = 'http://192.168.0.49:3001';

  // ip chrome
  static const String _base_url = "http://localhost:3001";

  // back LessonSharing
  // static const String _base_url = "https://a.gefor.lnsh.in/api";

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
    try {
      final response = await http.post(Uri.parse(_base_url + url),
          headers: _headers, body: jsonEncode(reqBody));
      if (response.statusCode == 200) {
        return json.decode(response.body)["success"];
      } else {
        return Future.error('erreur serveur');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<dynamic> putRequest(String url, var reqBody) async {
    try {
      final response = await http.put(Uri.parse(_base_url + url),
          headers: _headers, body: jsonEncode(reqBody));
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
