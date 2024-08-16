import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mental_health/features/music/data/models/song_model.dart';

abstract class SongRemoteDataSource {
  Future<List<SongModel>> getAllSongs();
}

class SongRemoteDataSourceImpl implements SongRemoteDataSource {
  final http.Client client;

  SongRemoteDataSourceImpl(this.client);

  @override
  Future<List<SongModel>> getAllSongs() async {
    try {
      final response = await client
          .get(Uri.parse("http://10.0.2.2:3005/api/songs/get-songs"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((song) => SongModel.fromMap(song)).toList();
      } else {
        throw Exception("Failed to load songs");
      }
    } catch (err) {
      rethrow;
    }
  }
}
