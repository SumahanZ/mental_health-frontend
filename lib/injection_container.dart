part of "injection_container_part.dart";

class InjectionContainer {
  static final getIt = GetIt.instance;

  static void setupContainer() {
    _setupGlobalDependencies();
    _setupMeditationFeature();
    _setupMusicFeature();
  }

  static void _setupGlobalDependencies() {
    getIt.registerLazySingleton(
      () => http.Client(),
    );

    getIt.registerLazySingleton(
      () => NavigationBloc(),
    );
  }

  static void _setupMeditationFeature() {
    //Meditation Remote Datasource
    getIt.registerFactory<MeditationRemoteDataSource>(
      () => MeditationRemoteDataSourceImpl(getIt()),
    );

    //Meditation Repository
    getIt.registerFactory<MeditationRepository>(
      () => MeditationRepositoryImpl(getIt()),
    );

    //Meditation Usecases
    getIt.registerFactory<GetDailyQuote>(
      () => GetDailyQuote(getIt()),
    );

    getIt.registerFactory<GetMoodMessage>(
      () => GetMoodMessage(getIt()),
    );

    //Mood Message Bloc
    getIt.registerLazySingleton(
      () => MoodMessageBloc(getIt()),
    );

    //Daily Quote Bloc
    getIt.registerLazySingleton(
      () => DailyQuoteBloc(getIt()),
    );
  }

  static void _setupMusicFeature() {
    //Song Remote Datasource
    getIt.registerFactory<SongRemoteDataSource>(
      () => SongRemoteDataSourceImpl(getIt()),
    );

    //Song Repository
    getIt.registerFactory<SongRepository>(
      () => SongRepositoryImpl(getIt()),
    );

    //Song Usecases
    getIt.registerFactory<GetAllSongs>(
      () => GetAllSongs(getIt()),
    );

    //Song Bloc
    getIt.registerLazySingleton(
      () => SongBloc(getAllSongs: getIt()),
    );
  }
}
