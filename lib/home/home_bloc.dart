import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvelapp/models/response_object.dart';
import 'dart:convert';
import 'package:marvelapp/network/network.dart';

const baseUrl = "http://gateway.marvel.com/v1/public";

class HomeBloc extends BlocBase {
  ResponseFull responseFull;
  String url = baseUrl + "/characters?ts=thesoer&apikey=b9d41b5ff1c83abb7e920c00d6664935&hash=8c657ed0c4d1d61637315f12fbf6b31e";

  final StreamController _streamController = StreamController();
  Sink get streamInput => _streamController.sink;
  Stream<ResponseFull> get streamOutput => _streamController.stream.asyncMap((url) => getUsers());

  getUsers() {
    API.getUsers(url).then((response) {
      final serviceReturn = json.decode(response.body);
      responseFull = new ResponseFull.fromJson(serviceReturn);
      return responseFull;
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamInput.close();
    _streamController.close();
  }
}
