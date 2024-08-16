part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class NavigateToTabEvent extends NavigationEvent {
  final int indexTab;

  NavigateToTabEvent(this.indexTab);
}
