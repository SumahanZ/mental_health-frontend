import 'package:get_it/get_it.dart';
import "package:http/http.dart" as http;
import 'package:mental_health/core/shared/presentation/bloc/navigation_bloc.dart';
import 'package:mental_health/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:mental_health/features/meditation/data/repositories/meditation_repository_impl.dart';
import 'package:mental_health/features/meditation/domain/repositories/meditation_repository.dart';
import 'package:mental_health/features/meditation/domain/usecases/get_daily_quote.dart';
import 'package:mental_health/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:mental_health/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:mental_health/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:mental_health/features/music/data/datasources/song_remote_datasource.dart';
import 'package:mental_health/features/music/data/repositories/song_repository_impl.dart';
import 'package:mental_health/features/music/domain/repositories/song_repository.dart';
import 'package:mental_health/features/music/domain/usecases/get_all_songs.dart';
import 'package:mental_health/features/music/presentation/bloc/song_bloc.dart';

part "injection_container.dart";
