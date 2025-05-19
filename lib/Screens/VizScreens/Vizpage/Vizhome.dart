import 'package:erohub/Screens/Homescreen/Homescreen.dart';
import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
// Import your widget
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../GlobalWidget/LoginScreen.dart';
import '../../../GlobalWidget/registerbuttons.dart';
import '../vizlevelscreens/viz_level_home.dart';
import 'internship_resgiter_page1.dart';

class vizhome extends StatefulWidget {
  const vizhome({super.key});

  @override
  State<vizhome> createState() => _vizhomeState();
}

class _vizhomeState extends State<vizhome> {
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
                    'images/image 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40, // Adjust depending on your safe area
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
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
                      color: Colors.white,
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
                              "Virtual Internships".toUpperCase(),
                              style: TextStyle(
                                color: Tcolors.viz_header_color,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Launch your career with us'.toUpperCase(),
                              style: TextStyle(
                                color: Tcolors.viz_subheader,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'About Virtual Internships:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              const_text.Vizcontent,
                              textAlign: TextAlign.justify,
                              style:  TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 2.0,
                                wordSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 4.h),
                      /*      Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Tcolors.viz_subheader,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black, width: 1.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(
                                      const_text.Vizcontainercontent,
                                      style: const TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    */
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
        backgroundcolor: Colors.deepPurple,
        backgroundfirstcolor: Colors.white,
        backgroundsecondcolor: Colors.transparent,
        borderfirstcolor: Colors.purple,
        bordersecondcolor: Colors.white,
        loginontap: Loginscreen(),
        registerontap: InternshipFormPage1(), textColor1: Colors.white, textColor2: Colors.black,
      ),
    );
  }
}
