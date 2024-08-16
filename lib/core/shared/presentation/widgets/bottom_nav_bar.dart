import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/shared/presentation/bloc/navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomNavigationItems;
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.bottomNavigationItems,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavigationItems,
      currentIndex: currentIndex,
      onTap: (index) {
        context.read<NavigationBloc>().add(NavigateToTabEvent(index));
      },
    );
  }
}
