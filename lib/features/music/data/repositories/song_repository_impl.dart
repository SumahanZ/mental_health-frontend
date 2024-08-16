import 'package:fpdart/fpdart.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/music/data/datasources/song_remote_datasource.dart';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';
import 'package:mental_health/features/music/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource songRemoteDataSource;

  SongRepositoryImpl(this.songRemoteDataSource);

  @override
  Future<Either<AppFailure, List<SongEntity>>> getAllSongs() async {
    try {
      final songs = await songRemoteDataSource.getAllSongs();
      return Right(songs);
    } catch (err) {
      return Left(ServerFailure(message: err.toString()));
    }
  }
}
