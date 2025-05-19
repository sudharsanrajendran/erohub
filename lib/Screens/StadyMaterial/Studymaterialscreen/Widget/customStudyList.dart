import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:flutter/material.dart';
import '../../../../Utils/Constants/Tcolors.dart';
import '../videoscreen.dart';

class Customstudylist extends StatelessWidget {
  const Customstudylist({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VideoPlayerScreen(
              videoUrl: 'images/7476131-uhd_2560_1440_24fps.mp4', // Replace with your actual video URL
            ),
          ),
        );
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Center(
              child: ListTile(
                leading: Text(
                  '01',
                  style: TextStyle(
                    color: Tcolors.studeymaterialappbar,
                    fontSize: 30,
                  ),
                ),
                title: Text(
                  const_text.Categoriestitle4,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'A Beginner Friendly Guide',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                trailing: Text(
                  '10 min',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
           Divider(
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
