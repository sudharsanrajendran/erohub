import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class work_ThreeScreen extends StatefulWidget {
  @override
  _work_ThreeScreenState createState() => _work_ThreeScreenState();
}

class _work_ThreeScreenState extends State<work_ThreeScreen> {
  File? selectedImage;
  File? recordedVideo;
  VideoPlayerController? _videoController;

  final ImagePicker _picker = ImagePicker();

  // Pick Image from Camera or Gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  // Record Video
  Future<void> _recordVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        recordedVideo = File(pickedFile.path);
        _videoController = VideoPlayerController.file(recordedVideo!)
          ..initialize().then((_) {
            setState(() {});
          });
      });
    }
  }

  // Delete Video
  void _deleteVideo() {
    if (recordedVideo != null) {
      recordedVideo!.delete();
      _videoController?.dispose();
      setState(() {
        recordedVideo = null;
        _videoController = null;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFCEFFD3),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _pickImage, // Pick image using image_picker
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text('Pick Image'),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: selectedImage != null
                            ? Image.file(selectedImage!) // Display the selected image
                            : Center(child: Text("No image selected")),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {}, // Upload image (your logic here)
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text('Upload'),
                      ),
                    ],
                  ),
                ),

                // Video Recording Section
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _recordVideo,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: Text("Start Recording"),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _deleteVideo,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Text("Delete Video"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Video Player
                      Container(
                        height: 200,
                        child: _videoController != null &&
                            _videoController!.value.isInitialized
                            ? AspectRatio(
                          aspectRatio: _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        )
                            : Center(child: Text("No video recorded")),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {}, // Upload video (your logic here)
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: Text("Upload"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _videoController != null &&
          _videoController!.value.isInitialized
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoController!.value.isPlaying
                ? _videoController!.pause()
                : _videoController!.play();
          });
        },
        child: Icon(_videoController!.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow),
      )
          : null,
    );
  }
}
