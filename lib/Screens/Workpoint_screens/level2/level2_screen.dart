
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:erohub/Utils/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../level3/Level3_screen.dart';


class workpoint_LevelTwoScreen extends StatelessWidget {
  final VoidCallback onLevelComplete;

  const workpoint_LevelTwoScreen({super.key, required this.onLevelComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.pink.withOpacity(0.2)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Image(image: AssetImage('images/icons/bookiconlevel2.png')),
                  SizedBox(height: 3.h),
                  const Text(
                    'Level 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // PDF Placeholder
                  Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "PDF PREVIEW HERE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Get.to(work_ThreeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Mark as Level 2 Completed"),
                  ),
                  const SizedBox(height: 30),

                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        child: Level2list(
                          title: 'Study',
                          image: Timages.Studyicon,
                          url: 'www.erphuub.com',
                        ),
                      ),
                      Expanded(
                        child: Level2list(
                          title: 'Design',
                          image: Timages.designicon,
                          url: 'www.erphuub.com',
                        ),
                      ),
                      Expanded(
                        child: Level2list(
                          title: 'Exam',
                          image: Timages.examicon,
                          url: 'www.erphuub.com',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        child: Level2list(
                          title: 'Internship',
                          image: Timages.internshipcrouse,
                          url: 'www.erphuub.com',
                        ),
                      ),
                      Expanded(
                        child: Level2list(
                          title: 'Materials',
                          image: Timages.Materialicon,
                          url: 'www.erphuub.com',
                        ),
                      ),
                      Expanded(
                        child: Level2list(
                          title: 'Support',
                          image: Timages.Support,
                          url: 'www.erphuub.com',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Custom Back Button
          // Custom Back Button
          Positioned(
            top: 5.h,
            left: 4.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class Level2list extends StatelessWidget {
  const Level2list({
    super.key,
    required this.url,
    required this.title,
    required this.image,
  });

  final String url;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Open: $url')),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Image.asset(image),
          title: Text(
            title,
            style: const_text.paragaraph.copyWith(fontSize: 10.spa),
          ),
          subtitle: Text(
            url,
            style: TextStyle(color: Colors.blue, fontSize: 14.sp),
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
