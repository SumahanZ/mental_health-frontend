import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/shared/presentation/bloc/navigation_bloc.dart';
import 'package:mental_health/core/shared/presentation/views/wrapper_page.dart';
import 'package:mental_health/core/theme/app_theme.dart';
import 'package:mental_health/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:mental_health/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:mental_health/features/music/presentation/bloc/song_bloc.dart';

import 'package:mental_health/injection_container_part.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectionContainer.setupContainer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InjectionContainer.getIt<NavigationBloc>(),
          ),
          BlocProvider(
            create: (context) =>
                InjectionContainer.getIt<SongBloc>()..add(FetchSongsEvent()),
          ),
          BlocProvider(
            create: (context) => InjectionContainer.getIt<DailyQuoteBloc>()
              ..add(FetchDailyQuoteEvent()),
          ),
          BlocProvider(
            create: (context) => InjectionContainer.getIt<MoodMessageBloc>(),
          ),
        ],
        child: WrapperPage(),
      ),
    );
  }
}
