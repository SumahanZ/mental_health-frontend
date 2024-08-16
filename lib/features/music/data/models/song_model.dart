import 'dart:convert';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.id,
    required super.title,
    required super.author,
    required super.songLink,
  });

  SongEntity copyWith({
    int? id,
    String? title,
    String? author,
    String? songLink,
  }) {
    return SongEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      songLink: songLink ?? this.songLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'songLink': songLink,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? "",
      author: map['author'] ?? "",
      songLink: map['songLink'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongModel(id: $id, title: $title, author: $author, songLink: $songLink)';
  }

  @override
  bool operator ==(covariant SongModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.author == author &&
        other.songLink == songLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ author.hashCode ^ songLink.hashCode;
  }
}
