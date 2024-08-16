import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<AppFailure, List<SongEntity>>> getAllSongs();
}
