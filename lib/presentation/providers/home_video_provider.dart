import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class HomeVideoProvider extends StateNotifier<VideoPlayerController?> {
  HomeVideoProvider() : super(null) {
    _initialize();
  }

  Future<void> _initialize() async {
    final controller = VideoPlayerController.asset(
      'assets/videos/Web_Hompage_12s_Video_030223.mp4',
    );

    await controller.initialize().then((_) {
      controller.setVolume(0);
      controller.setLooping(true);
      controller.play();
    }, onError: (error) {
      debugPrint(
        '[Video Player] There is an error when attempting to play video',
      );
    });
    state = controller; // Set the state to the initialized controller
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}

final homeVideoProvider =
    StateNotifierProvider<HomeVideoProvider, VideoPlayerController?>((ref) {
  return HomeVideoProvider();
});
