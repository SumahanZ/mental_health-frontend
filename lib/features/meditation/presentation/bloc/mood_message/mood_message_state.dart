part of 'mood_message_bloc.dart';

@immutable
sealed class MoodMessageState {}

final class MoodMessageInitial extends MoodMessageState {}

final class MoodMessageLoaded extends MoodMessageState {
  final MoodMessageEntity moodMessage;

  MoodMessageLoaded(this.moodMessage);
}
