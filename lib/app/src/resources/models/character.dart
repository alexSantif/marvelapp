import 'package:marvelapp/app/src/resources/models/thumbnail.dart';

class Character {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;

  Character(int id, String name, String description, Thumbnail thumbnail) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.thumbnail = thumbnail;
  }

  Character.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        thumbnail = Thumbnail.fromJson(json['thumbnail']);

  Map toJson() {
    return {'id': id, 'name': name, 'description': description, 'thumbnail': thumbnail};
  }
}
