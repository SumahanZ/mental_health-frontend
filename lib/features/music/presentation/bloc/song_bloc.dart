import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';
import 'package:mental_health/features/music/domain/usecases/get_all_songs.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetAllSongs getAllSongs;

  SongBloc({required this.getAllSongs}) : super(SongInitial()) {
    on<FetchSongsEvent>(_onFetchSongs);
  }

  FutureOr<void> _onFetchSongs(
    FetchSongsEvent event,
    Emitter<SongState> emit,
  ) async {
    emit(SongLoading());
    final result = await getAllSongs.call();
    result.fold((l) => emit(SongError(l)), (r) => emit(SongLoaded(r)));
  }
}
