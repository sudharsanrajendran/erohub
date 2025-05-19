import 'package:erohub/Screens/VizScreens/vizlevelscreens/QiuzScreen.dart';
import 'package:erohub/Screens/Workpoint_screens/Quiz_screens/workpoint_QiuzScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/Constants/Tcolors.dart';
import '../../VizScreens/vizlevelscreens/level2/Level2_screen.dart';
import '../level2/level2_screen.dart';

class workpoint_Quiz_Home extends StatelessWidget {
  const workpoint_Quiz_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD2A6), // Peach background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
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
                SizedBox(height: 2.h),
                Center(
                  child: Text(
                    'Explore Our Case\nStudies - Levels',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Center(
                  child: Container(
                    width: 40.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('images/image 5.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                 LevelBox(
                  color: Color(0xFFFFFFD9),
                  title: 'Level 1',
                  subtitle: 'Introduction to Case Studies',
                   ontap:work_QuizScreen()
                ),
                 LevelBox(
                  color: Color(0xFFFFD7F2),
                  title: 'Level 2',
                  subtitle: 'Detailed Exploration',
                  ontap:workpoint_LevelTwoScreen(onLevelComplete: () {  },),
                ),
                const LevelBox(
                  color: Color(0xFFD7FFD9),
                  title: 'Level 3',
                  subtitle: 'Real-time Examples',
                  ontap:() ,
                ),
                const LevelBox(
                  color: Color(0xFFD7FFD9),
                  title: 'Level 4',
                  subtitle: 'Hands-on Practice',
                  ontap: (),
                ),
                const LevelBox(
                  color: Color(0xFFD7FFD9),
                  title: 'Level 5',
                  subtitle: 'Assessment & Wrap-up',
                  ontap: (),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class LevelBox extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final ontap;

  const LevelBox({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and subtitle section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
          // Continue button
          GestureDetector(
            onTap: (){
              Get.to(ontap);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: Tcolors.viz_subheader,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(2, 2)),
                ],
              ),
              child:  Text(
                'Continue',
                style: TextStyle(color: Colors.white,fontSize: 13.spa),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

