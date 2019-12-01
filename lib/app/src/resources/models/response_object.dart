import 'package:marvelapp/app/src/resources/models/response_data.dart';

class ResponseFull {
  int code;
  String status;
  ResponseData data;

  ResponseFull(int code, String status, ResponseData data) {
    this.code = code;
    this.status = status;
    this.data = data;
  }

  ResponseFull.fromJson(Map json)
      : code = json['code'],
        status = json['status'],
        data = ResponseData.fromJson(json['data']);

  Map toJson() {
    return {'code': code, 'status': status, 'data': data};
  }
}
