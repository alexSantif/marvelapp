import 'dart:async';
import '../remote/network_provider.dart';
import 'package:marvelapp/app/src/resources/models/response_object.dart';

class Repository {
  final provider = Provider();

  Future<ResponseFull> getUsers() => provider.getUsers();
}