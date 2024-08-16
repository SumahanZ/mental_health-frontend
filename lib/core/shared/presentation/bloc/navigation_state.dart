part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationCurrentTabState extends NavigationState {
  final int indexTab;

  NavigationCurrentTabState(this.indexTab);
}
