import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/failures/failure.dart';
import 'package:mental_health/features/meditation/domain/entities/daily_quote_entity.dart';
import 'package:mental_health/features/meditation/domain/usecases/get_daily_quote.dart';

part 'daily_quote_event.dart';
part 'daily_quote_state.dart';

class DailyQuoteBloc extends Bloc<DailyQuoteEvent, DailyQuoteState> {
  final GetDailyQuote getDailyQuote;

  DailyQuoteBloc(this.getDailyQuote) : super(DailyQuoteInitial()) {
    on<FetchDailyQuoteEvent>(_onFetchDailyQuote);
  }

  FutureOr<void> _onFetchDailyQuote(
    FetchDailyQuoteEvent event,
    Emitter<DailyQuoteState> emit,
  ) async {
    emit(DailyQuoteLoading());
    final result = await getDailyQuote.call();
    result.fold(
      (l) => emit(DailyQuoteError(l)),
      (r) => emit(DailyQuoteLoaded(r)),
    );
  }
}
