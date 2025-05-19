import 'package:erohub/Screens/R&D_screen/submissionfrom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../GlobalWidget/LoginScreen.dart';
import '../../GlobalWidget/registerbuttons.dart';
import '../../Utils/Constants/Tcolors.dart';
import '../../Utils/Constants/const_texts.dart';
import '../VizScreens/Vizpage/internship_resgiter_page1.dart';
import 'R_D_ resgiter_form.dart';

class Reach_and_development_home extends StatefulWidget {
  const Reach_and_development_home({super.key});

  @override
  State<Reach_and_development_home> createState() => _vizhomeState();
}

class _vizhomeState extends State<Reach_and_development_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'images/image 3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10, // Adjust depending on your safe area
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate back
                    },
                  ),
                ),
                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF396FE3),
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
                              "Research and Development".toUpperCase(),
                              style:const_text.bigwhitetext.copyWith(fontSize: 20.sp)
                            ),
                            Text(
                              'Launch your career with us'.toUpperCase(),
                              style: const_text.smallwhite.copyWith(color: Colors.yellow)
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'About Research and Development :',
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
      ),
      bottomNavigationBar: VizBottomBar(
        backgroundcolor: Colors.white,
        backgroundfirstcolor: Color(0xFF396FE3),
        backgroundsecondcolor: Colors.transparent,
        borderfirstcolor: Colors.white,
        bordersecondcolor: Color(0xFF396FE3),
        loginontap: Loginscreen(),
        registerontap: RDRegisterForm(),
        textColor1: Colors.white,
        textColor2:Color(0xFF396FE3),
      ),
    );
  }
}