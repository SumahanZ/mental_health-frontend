import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/core/usecase.dart';
import 'package:mental_health/features/meditation/domain/entities/mood_message_entity.dart';
import 'package:mental_health/features/meditation/domain/repositories/meditation_repository.dart';

class GetMoodMessage
    implements UseCase<String, Future<Either<AppFailure, MoodMessageEntity>>> {
  final MeditationRepository meditationRepository;

  GetMoodMessage(this.meditationRepository);

  @override
  Future<Either<AppFailure, MoodMessageEntity>> call(String params) async {
    return meditationRepository.getMoodMessage(params);
  }
}
