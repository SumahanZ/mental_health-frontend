part of 'mood_message_bloc.dart';

@immutable
sealed class MeditationEvent {}

class FetchMoodMessageEvent extends MeditationEvent {
  final String mood;

  FetchMoodMessageEvent(this.mood);
}
