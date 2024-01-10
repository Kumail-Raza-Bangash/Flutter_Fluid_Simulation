import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreenProvider extends ChangeNotifier {
  late VideoPlayerController _videoPlayerController;

  VideoPlayerController get videoController => _videoPlayerController;

  SplashScreenProvider() {
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _videoPlayerController = VideoPlayerController.asset('assets/videos/V001.mp4');

      await _videoPlayerController.initialize();

      _videoPlayerController.setLooping(true);

      notifyListeners(); // Notify listeners after initialization
    } catch (e) {
      print('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
