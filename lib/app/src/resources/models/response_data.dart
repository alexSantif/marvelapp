import 'package:marvelapp/app/src/resources/models/character.dart';

class ResponseData {
  int limit;
  int count;
  List<Character> results;

  ResponseData({
    this.limit,
    this.count,
    this.results,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Character> imagesList = list.map((i) => Character.fromJson(i)).toList();

    return ResponseData(
        limit: json['limit'],
        count: json['count'],
        results: imagesList
    );
  }

  Map toJson() {
    return {'limit': limit, 'count': count, 'results': results};
  }
}
