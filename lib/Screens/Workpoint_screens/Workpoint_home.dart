
import 'package:erohub/Screens/Workpoint_screens/workpointregister_page/internship_resgiter_page1.dart';
import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../GlobalWidget/LoginScreen.dart';
import '../../GlobalWidget/registerbuttons.dart';
import '../../Utils/Constants/const_texts.dart';
import '../R&D_screen/R_D_ resgiter_form.dart';

class Workpoint_home extends StatefulWidget {
  const Workpoint_home({super.key});

  @override
  State<Workpoint_home> createState() => _vizhomeState();
}

class _vizhomeState extends State<Workpoint_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'images/image 3 (1).png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40, // Adjust depending on your safe area
                left: 0,
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
              Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Tcolors.viz_login_color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(  // Make only this part scrollable
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "Workpoint-EHT".toUpperCase(),
                              style:const_text.bigwhitetext.copyWith(fontSize: 20.sp)
                          ),
                          Text(
                              'Creative challenges are our Passion'.toUpperCase(),
                              style: const_text.smallwhite.copyWith(color: Colors.yellow)
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'About Workpoint-EHT :',
                                style: const_text.smallwhite
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            const_text.r_and_dcontnet,
                            textAlign: TextAlign.justify,
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              height: 2.0,
                              wordSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: VizBottomBar(
        backgroundcolor: Colors.white,
        backgroundfirstcolor: Tcolors.viz_login_color,
        backgroundsecondcolor: Colors.transparent,
        borderfirstcolor: Colors.white,
        bordersecondcolor: Tcolors.viz_login_color,
        loginontap: Loginscreen(),
        registerontap: WorkpointFormPage1(),
        textColor1: Colors.white,
        textColor2:Tcolors.viz_login_color
      ),
    );
  }
}