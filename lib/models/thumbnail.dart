class Thumbnail {
  String path;
  String extension;

  Thumbnail(String path, String extension) {
    this.path = path;
    this.extension = extension;
  }

  Thumbnail.fromJson(Map json)
      : path = json['path'],
        extension = json['extension'];

  Map toJson() {
    return {'path': path, 'extension': extension};
  }
}
