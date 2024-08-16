import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mental_health/features/meditation/domain/entities/mood_message_entity.dart';

import 'package:mental_health/features/meditation/domain/usecases/get_mood_message.dart';

part 'mood_message_event.dart';
part 'mood_message_state.dart';

class MoodMessageBloc extends Bloc<MeditationEvent, MoodMessageState> {
  final GetMoodMessage getMoodMessage;
  MoodMessageBloc(this.getMoodMessage) : super(MoodMessageInitial()) {
    on<FetchMoodMessageEvent>(_onFetchMoodMessage);
  }

  FutureOr<void> _onFetchMoodMessage(
    FetchMoodMessageEvent event,
    Emitter<MoodMessageState> emit,
  ) async {
    final result = await getMoodMessage.call(event.mood);
    result.fold((l) => print(l), (r) {
      print(r);
      emit(MoodMessageLoaded(r));
    });
  }
}
