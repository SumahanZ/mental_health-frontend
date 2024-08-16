import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/theme/app_theme.dart';
import 'package:mental_health/features/music/presentation/views/music_player_page.dart';

import '../bloc/song_bloc.dart';

class PlaylistPage extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Rain on Glass",
      "artist": "Rain on Glass",
      "thumbnail": "assets/images/child_with_dog.png",
    },
    {
      "title": "Gentle Breeze",
      "artist": "Soothing Sounds",
      "thumbnail": "assets/images/child_with_dog.png",
    },
    {
      "title": "Whispering Pines",
      "artist": "Nature Vibes",
      "thumbnail": "assets/images/child_with_dog.png",
    },
    {
      "title": "Ocean Breeze",
      "artist": "Soothing Sounds",
      "thumbnail": "assets/images/child_with_dog.png",
    },
  ];

  PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.appWhite,
        elevation: 1,
        centerTitle: false,
        title: Text(
          "Chill Playlist",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SongLoaded) {
            return Container(
              color: DefaultColors.appWhite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(songs[index]["thumbnail"]!),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(
                      state.songs[index].title,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    subtitle: Text(
                      state.songs[index].author,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MusicPlayerPage(
                            song: state.songs[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else if (state is SongError) {
            return Center(
              child: Text(
                state.failure.message,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: Text(
                "No songs found",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
