part of 'daily_quote_bloc.dart';

@immutable
sealed class DailyQuoteEvent {}

class FetchDailyQuoteEvent extends DailyQuoteEvent {}
