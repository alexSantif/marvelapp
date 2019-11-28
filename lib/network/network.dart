import 'dart:async';
import 'package:http/http.dart' as http;

class API {
  static Future getUsers(url) async {
    return await http.get(url);
  }
}