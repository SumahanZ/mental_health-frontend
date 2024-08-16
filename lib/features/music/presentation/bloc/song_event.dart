part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class FetchSongsEvent extends SongEvent {}
