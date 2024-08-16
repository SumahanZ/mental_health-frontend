import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/meditation/domain/entities/daily_quote_entity.dart';
import 'package:mental_health/features/meditation/domain/entities/mood_message_entity.dart';

abstract class MeditationRepository {
  Future<Either<AppFailure, DailyQuoteEntity>> getDailyQuote();
  Future<Either<AppFailure, MoodMessageEntity>> getMoodMessage(String mood);
}
