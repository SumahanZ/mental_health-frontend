import 'dart:convert';

import 'package:mental_health/features/meditation/domain/entities/mood_message_entity.dart';

class MoodMessageModel extends MoodMessageEntity {
  MoodMessageModel(super.text);

  MoodMessageModel copyWith({
    String? text,
  }) {
    return MoodMessageModel(
      text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'advice': text,
    };
  }

  factory MoodMessageModel.fromMap(Map<String, dynamic> map) {
    return MoodMessageModel(
      map['advice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoodMessageModel.fromJson(String source) =>
      MoodMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MoodMessageModel(text: $text)';

  @override
  bool operator ==(covariant MoodMessageModel other) {
    if (identical(this, other)) return true;

    return other.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
