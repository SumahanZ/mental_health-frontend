import 'dart:convert';

import 'package:mental_health/features/meditation/domain/entities/daily_quote_entity.dart';

class DailyQuoteModel extends DailyQuoteEntity {
  DailyQuoteModel({
    required super.morningQuote,
    required super.eveningQuote,
    required super.noonQuote,
  });

  DailyQuoteModel copyWith({
    String? morningQuote,
    String? eveningQuote,
    String? noonQuote,
  }) {
    return DailyQuoteModel(
      morningQuote: morningQuote ?? this.morningQuote,
      eveningQuote: eveningQuote ?? this.eveningQuote,
      noonQuote: noonQuote ?? this.noonQuote,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'morningQuote': morningQuote,
      'eveningQuote': eveningQuote,
      'noonQuote': noonQuote,
    };
  }

  factory DailyQuoteModel.fromMap(Map<String, dynamic> map) {
    return DailyQuoteModel(
      morningQuote: map['morningQuote'] ??
          "Let's open up to the thing that matters among the people",
      eveningQuote: map['eveningQuote'] ??
          "Let's open up to the thing that matters among the people",
      noonQuote: map['noonQuote'] ??
          "Let's open up to the thing that matters among the people",
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyQuoteModel.fromJson(String source) =>
      DailyQuoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DailyQuoteModel(morningQuote: $morningQuote, eveningQuote: $eveningQuote, noonQuote: $noonQuote)';

  @override
  bool operator ==(covariant DailyQuoteModel other) {
    if (identical(this, other)) return true;

    return other.morningQuote == morningQuote &&
        other.eveningQuote == eveningQuote &&
        other.noonQuote == noonQuote;
  }

  @override
  int get hashCode =>
      morningQuote.hashCode ^ eveningQuote.hashCode ^ noonQuote.hashCode;
}
