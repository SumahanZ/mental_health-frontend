import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationCurrentTabState(0)) {
    on<NavigateToTabEvent>(_onNavigateToTab);
  }

  FutureOr<void> _onNavigateToTab(
    NavigateToTabEvent event,
    Emitter<NavigationState> emit,
  ) {
    print("triggered navigationTab");
    emit(NavigationCurrentTabState(event.indexTab));
  }
}
