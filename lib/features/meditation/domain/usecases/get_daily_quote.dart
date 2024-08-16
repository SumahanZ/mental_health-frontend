import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/core/usecase.dart';

import 'package:mental_health/features/meditation/domain/entities/daily_quote_entity.dart';
import 'package:mental_health/features/meditation/domain/repositories/meditation_repository.dart';

class GetDailyQuote
    implements UseCaseNoParams<Future<Either<AppFailure, DailyQuoteEntity>>> {
  final MeditationRepository meditationRepository;

  GetDailyQuote(this.meditationRepository);

  @override
  Future<Either<AppFailure, DailyQuoteEntity>> call() {
    return meditationRepository.getDailyQuote();
  }
}
