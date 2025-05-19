import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isLandscape = false;
  bool _showControls = true;
  Timer? _hideTimer;
  double _volume = 0.5;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _startHideTimer();
      });

    FlutterVolumeController.getVolume().then((v) {
      setState(() => _volume = v!);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _toggleOrientation() {
    if (_isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    setState(() => _isLandscape = !_isLandscape);
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() => _showControls = false);
    });
  }

  void _onTapVideoArea() {
    setState(() => _showControls = !_showControls);
    if (_showControls) _startHideTimer();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details, Size size) {
    final dy = details.delta.dy;
    final position = details.localPosition;

    if (position.dx > size.width / 2) {
      setState(() {
        _volume -= dy / 300;
        _volume = _volume.clamp(0.0, 1.0);
        FlutterVolumeController.setVolume(_volume);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: _onTapVideoArea,
            onVerticalDragUpdate: (details) =>
                _onVerticalDragUpdate(details, constraints.biggest),
            child: Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),

                // Back button
                if (_showControls)
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 30),
                    ),
                  ),

                // Volume indicator
                if (_showControls)
                  Positioned(
                    top: 40,
                    right: 20,
                    child: Row(
                      children: [
                        const Icon(Icons.volume_up, color: Colors.white),
                        Text(
                          "${(_volume * 100).toInt()}%",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                // Play/pause button
                if (_showControls)
                  Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                            _startHideTimer();
                          }
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),

                // Orientation toggle
                if (_showControls)
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: _toggleOrientation,
                      icon: Icon(
                        _isLandscape
                            ? Icons.screen_lock_portrait
                            : Icons.screen_lock_landscape,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
