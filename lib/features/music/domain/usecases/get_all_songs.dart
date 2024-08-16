import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/core/usecase.dart';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';
import 'package:mental_health/features/music/domain/repositories/song_repository.dart';

class GetAllSongs
    extends UseCaseNoParams<Future<Either<AppFailure, List<SongEntity>>>> {
  final SongRepository songRepository;

  GetAllSongs(this.songRepository);

  @override
  Future<Either<AppFailure, List<SongEntity>>> call() async {
    return await songRepository.getAllSongs();
  }
}
