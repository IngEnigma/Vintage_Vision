import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:vintage_vision/core/models/movie_model.dart';

class MoviePlayerScreen extends StatefulWidget {
  final Movie movie;

  const MoviePlayerScreen({super.key, required this.movie});

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
  }

  class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
    late FlickManager flickManager;

    @override
    void initState() {
      super.initState();
      // Configurar el reproductor con el video del asset
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(widget.movie.url),
      );
    }

  @override
  void dispose() {
    flickManager.dispose(); // Liberar recursos al cerrar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(flickManager: flickManager),
          ),
        ),
      ),
    );
  }
}