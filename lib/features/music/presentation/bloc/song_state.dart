part of 'song_bloc.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongLoaded extends SongState {
  final List<SongEntity> songs;

  SongLoaded(this.songs);
}

final class SongError extends SongState {
  final AppFailure failure;

  SongError(this.failure);
}
