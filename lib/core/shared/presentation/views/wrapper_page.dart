import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/shared/presentation/bloc/navigation_bloc.dart';
import 'package:mental_health/core/shared/presentation/widgets/bottom_nav_bar.dart';
import 'package:mental_health/features/meditation/presentation/views/meditation_page.dart';
import 'package:mental_health/features/music/presentation/views/playlist_page.dart';

class WrapperPage extends StatelessWidget {
  WrapperPage({super.key});

  final List<Widget> pages = [
    const MeditationPage(),
    PlaylistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/images/menu_home.png",
        ),
        activeIcon: Image.asset(
          "assets/images/menu_home.png",
          color: Theme.of(context).focusColor,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/images/menu_songs.png",
        ),
        activeIcon: Image.asset(
          "assets/images/menu_songs.png",
          color: Theme.of(context).focusColor,
        ),
        label: "",
      ),
    ];
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationCurrentTabState) {
            return pages[state.indexTab];
          }

          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationCurrentTabState) {
            currentIndex = state.indexTab;
          }

          return BottomNavBar(
            bottomNavigationItems: bottomNavItems,
            currentIndex: currentIndex,
          );
        },
      ),
    );
  }
}
