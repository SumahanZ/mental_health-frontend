import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mental_health/features/meditation/data/models/daily_quote_model.dart';
import 'package:mental_health/features/meditation/data/models/mood_message_model.dart';

abstract class MeditationRemoteDataSource {
  Future<MoodMessageModel> getMoodMessage(String mood);
  Future<DailyQuoteModel> getDailyQuote();
}

class MeditationRemoteDataSourceImpl implements MeditationRemoteDataSource {
  final http.Client client;

  MeditationRemoteDataSourceImpl(this.client);

  @override
  Future<DailyQuoteModel> getDailyQuote() async {
    try {
      final response = await client
          .get(Uri.parse("http://10.0.2.2:3005/api/meditation/dailyQuote"));

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);

        Map<String, dynamic> nestedJson = json.decode(jsonResponse["text"]);

        return DailyQuoteModel.fromMap(nestedJson);
      } else {
        throw Exception("Failed to get daily quote");
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<MoodMessageModel> getMoodMessage(String mood) async {
    try {
      final response = await client.get(
        Uri.parse("http://10.0.2.2:3005/api/meditation/adviceByMood/$mood"),
      );

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);

        Map<String, dynamic> nestedJson = json.decode(jsonResponse["text"]);

        return MoodMessageModel.fromMap(nestedJson);
      } else {
        throw Exception("Failed to get mood message");
      }
    } catch (err) {
      rethrow;
    }
  }
}
