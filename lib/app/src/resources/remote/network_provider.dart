import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvelapp/app/src/resources/models/response_object.dart';

const baseUrl = "http://gateway.marvel.com/v1/public";

class Provider {
  Future<ResponseFull> getUsers() async {
    String url = baseUrl +
        "/characters?ts=thesoer&apikey=b9d41b5ff1c83abb7e920c00d6664935&hash=8c657ed0c4d1d61637315f12fbf6b31e";
    final response = await http.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ResponseFull.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
