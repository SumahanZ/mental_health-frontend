import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mental_health/core/theme/app_theme.dart';
import 'package:mental_health/features/music/domain/entities/song_entity.dart';

class MusicPlayerPage extends StatefulWidget {
  final SongEntity song;
  const MusicPlayerPage({super.key, required this.song});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    );
    togglePlayPause();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      if (_audioPlayer.playing) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.play();
      }
    });
  }

  void seekBackward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _audioPlayer.seek(newPosition);
  }

  void seekRestart() {
    _audioPlayer.seek(Duration.zero);
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/images/down_arrow.png"),
        ),
        actions: [
          Image.asset("assets/images/transcript_icon.png"),
          const SizedBox(width: 16),
        ],
      ),
      backgroundColor: DefaultColors.appWhite,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Column(
            children: [
              //artwork
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/child_with_dog.png",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              //Text(title)
              const SizedBox(height: 16),
              Text(
                widget.song.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              //Text(author_name)
              Text(
                "By : ${widget.song.author}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Spacer(),
              StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;

                  return ProgressBar(
                    baseBarColor: DefaultColors.lightpink,
                    thumbColor: DefaultColors.pink,
                    progressBarColor: DefaultColors.pink,
                    progress: position,
                    total: _audioPlayer.duration ?? Duration.zero,
                    onSeek: (duration) {
                      _audioPlayer.seek(duration);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle, color: DefaultColors.pink),
                  ),
                  IconButton(
                    onPressed: seekBackward,
                    icon: const Icon(
                      Icons.skip_previous,
                      color: DefaultColors.pink,
                    ),
                  ),
                  StreamBuilder<PlayerState>(
                    stream: _audioPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processState =
                          playerState?.processingState ?? ProcessingState.idle;
                      final playing = playerState?.playing ?? false;

                      //loading the song to be played
                      if (processState == ProcessingState.loading ||
                          processState == ProcessingState.buffering) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          width: 50,
                          height: 50,
                          child: const CircularProgressIndicator(
                            color: DefaultColors.pink,
                          ),
                        );
                      } else if (!playing) {
                        return IconButton(
                          onPressed: togglePlayPause,
                          iconSize: 80,
                          icon: const Icon(
                            Icons.play_circle_filled,
                            color: DefaultColors.pink,
                          ),
                        );
                      } else if (playing &&
                          processState != ProcessingState.completed) {
                        return IconButton(
                          onPressed: togglePlayPause,
                          iconSize: 80,
                          icon: const Icon(
                            Icons.pause_circle_filled,
                            color: DefaultColors.pink,
                          ),
                        );
                      } else {
                        return IconButton(
                          onPressed: seekRestart,
                          iconSize: 80,
                          icon: const Icon(
                            Icons.replay_circle_filled,
                            color: DefaultColors.pink,
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    onPressed: seekForward,
                    icon: const Icon(
                      Icons.skip_next,
                      color: DefaultColors.pink,
                    ),
                  ),
                  IconButton(
                    onPressed: toggleLoop,
                    icon: Icon(
                      isLooping ? Icons.repeat_one : Icons.repeat,
                      color: DefaultColors.pink,
                    ),
                  ),
                ],
              ),
              //Action button (author name)
            ],
          ),
        ),
      ),
    );
  }
}
