import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:mental_health/features/meditation/domain/entities/daily_quote_entity.dart';
import 'package:mental_health/features/meditation/domain/entities/mood_message_entity.dart';
import 'package:mental_health/features/meditation/domain/repositories/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDataSource meditationRemoteDataSource;

  MeditationRepositoryImpl(this.meditationRemoteDataSource);

  @override
  Future<Either<AppFailure, DailyQuoteEntity>> getDailyQuote() async {
    try {
      final dailyQuote = await meditationRemoteDataSource.getDailyQuote();
      return Right(dailyQuote);
    } catch (err) {
      return Left(ServerFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<AppFailure, MoodMessageEntity>> getMoodMessage(
    String mood,
  ) async {
    try {
      final moodMessage = await meditationRemoteDataSource.getMoodMessage(mood);
      return Right(moodMessage);
    } catch (err) {
      return Left(ServerFailure(message: err.toString()));
    }
  }
}
