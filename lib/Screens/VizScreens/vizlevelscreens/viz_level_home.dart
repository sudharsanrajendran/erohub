import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../custom_widgets/Custom_Level_colums.dart';
import 'QiuzScreen.dart';
import 'level2/Level2_screen.dart';
import 'level3/Level3_screen.dart';

class VizLevelHome extends StatefulWidget {
  const VizLevelHome({super.key});

  @override
  State<VizLevelHome> createState() => _VizLevelHomeState();
}

class _VizLevelHomeState extends State<VizLevelHome> {
  final storage = GetStorage();

  bool isLevel1Completed = false;
  bool isLevel2Completed = false;

  @override
  void initState() {
    super.initState();
    isLevel1Completed = storage.read('level1') ?? false;
    isLevel2Completed = storage.read('level2') ?? false;
  }

  void handleLevel1Completion() async {
    final result = await Get.to(() => QuizScreen());
    if (result == true) {
      setState(() {
        isLevel1Completed = true;
        storage.write('level1', true);
      });
    }
  }

  void handleLevel2Completion() async {
    final result = await Get.to(() => LevelTwoScreen(onLevelComplete: () {}));
    if (result == true) {
      setState(() {
        isLevel2Completed = true;
        storage.write('level2', true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
    child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: "Exit App",
                    middleText: "Do you want to close the app?",
                    textCancel: "No",
                    textConfirm: "Yes",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      SystemNavigator.pop(); // or use exit(0) from 'dart:io';
                    },
                  );
                },
                child: Icon(Icons.arrow_back, color: Colors.white, size: 6.w),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: Text(
                    "Logout",
                    style: const_text.paragaraph,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            'Explore Our Internship Opportunities',
            style: const_text.bigwhitetext,
          ),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            'Discover exciting career opportunities with our internship programs. '
                'Gain hands-on experience, develop valuable skills.',
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
        ),
        SizedBox(height: 5.h),
        Center(child: Image.asset('images/image 4.png')),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLevelColumn(
              level: 'Level 1',
              levelname: 'Primary\nScreening',
              image: 'images/icons/pulb.png',
              ontap: handleLevel1Completion,
              statusText: isLevel1Completed ? 'Completed' : 'Get Started',
            ),
            SizedBox(width: 5.w),
            CustomLevelColumn(
              level: 'Level 2',
              levelname: 'Project \nGuid Line',
              image: 'images/icons/streamline_next.png',
              ontap: () {
                if (isLevel1Completed) {
                  handleLevel2Completion();
                } else {
                  Get.snackbar("Access Denied", "Please complete Level 1 first");
                }
              },
              statusText: isLevel2Completed ? 'Completed' : 'Get Started',
            ),
            SizedBox(width: 5.w),
            CustomLevelColumn(
              level: 'Level 3',
              levelname: 'Go Live\n',
              image: 'images/icons/level3icon.png',
              ontap: () {
                if (isLevel1Completed && isLevel2Completed) {
                  Get.to(() => LevelThreeScreen());
                } else {
                  Get.snackbar("Access Denied", "Complete Levels 1 and 2 first");
                }
              },
              statusText: (isLevel1Completed && isLevel2Completed) ? 'Available' : 'Locked',
            ),
          ],
        ),
        SizedBox(height: 4.h), // Add some padding at the bottom
      ],
    ),
    ),
    ),

    );
  }
}
