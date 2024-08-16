part of 'daily_quote_bloc.dart';

@immutable
sealed class DailyQuoteState {}

final class DailyQuoteInitial extends DailyQuoteState {}

final class DailyQuoteLoading extends DailyQuoteState {}

final class DailyQuoteLoaded extends DailyQuoteState {
  final DailyQuoteEntity dailyQuote;

  DailyQuoteLoaded(this.dailyQuote);
}

final class DailyQuoteError extends DailyQuoteState {
  final AppFailure failure;

  DailyQuoteError(this.failure);
}
