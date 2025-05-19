import 'dart:ui';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:erohub/Utils/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../GlobalWidget/Homeicon.dart';
import '../../Utils/Constants/Tcolors.dart';
import '../R&D_screen/Reseach_developmenty_home.dart';
import '../StadyMaterial/Studymaterialscreen/studymaterial_page.dart';
import '../VizScreens/Vizpage/Vizhome.dart';
import 'CustomWidgets/GlassstyleContainer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton: homeicon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,



      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Tcolors.homebackgroundcolor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                // Teal circle
                Positioned(
                  left: 5.w,
                  top: 2.h,
                  child: ClipRRect(

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        height: 25.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          gradient: RadialGradient(
                            colors: [Color(0xFF20C6B1), Color(0xFFFFFFFF)],
                            stops: [0.1, 0.4],
                            radius: 1.6,
                            center: Alignment.center,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white54,
                              blurRadius: 30,
                              spreadRadius: 5,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Purple circle
                Positioned(
                  right: -10.w,
                  top: 1.h,
                  child: Container(
                    height: 35.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(125)),
                      gradient: RadialGradient(
                        colors: [Color(0xFFF46BF2), Color(0xFFFFFFFF)],
                        stops: [0.1, 0.4],
                        radius: 1.6,
                        center: Alignment.center,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white12,
                          blurRadius: 100,
                          spreadRadius: 5,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                  ),
                ),

                // Blue circle
                Positioned(
                  left: 3.w,
                  top: 20.h,
                  child: Container(
                    height: 10.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(125)),
                      gradient: RadialGradient(
                        colors: [Color(0xFFB4CCF3)],
                        stops: [0.1],
                        radius: 1.6,
                        center: Alignment.center,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white12,
                          blurRadius: 100,
                          spreadRadius: 5,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                  ),
                ),

                // 🆕 Glass blur background layer
                // Reduced height glass blur background with visible border
                Positioned(
                  top: 0, // Adjust as needed
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      height: 65.h, // Adjust the height as needed
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white54.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ),

                // ⬇️ Main content
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          const_text.homettile1,
                          style: GoogleFonts.balooBhai2(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          const_text.homesubtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            color: const Color(0xFF3D3D3D),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                              child: SearchBar(
                                hintText: 'Search...',
                                elevation: MaterialStateProperty.all(1),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFFF4F5FF)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.search_rounded,
                                color: Color(0x7B7D7EF0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          const_text.hometitle2,
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            color: const Color(0xFF3D3D3D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // Icon containers
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Iconcontainer(
                                    ontap: () {
                                      Get.to(vizhome());
                                    },
                                    title: const_text.Categoriestitle1,
                                    images: Timages.internship,
                                  ),
                                  SizedBox(width: 20),
                                  Iconcontainer(
                                    ontap: () {
                                      Get.to(Reach_and_development_home());
                                    },
                                    title: const_text.Categoriestitle2,
                                    images: Timages.reseachanddevelopment,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Iconcontainer(
                                    ontap: () {
                                      Get.to(vizhome());
                                    },
                                    title: const_text.Categoriestitle3,
                                    images: Timages.workpoint,
                                  ),
                                  SizedBox(width: 20),
                                  Iconcontainer(
                                    ontap: () {
                                      Get.to(StudymaterialPage());
                                    },
                                    title: const_text.Categoriestitle4,
                                    images: Timages.study,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height:  5),
                            Text(
                              const_text.hometitle3,
                              style: GoogleFonts.abel(
                                fontSize: 18.sp,
                                color: const Color(0xFF3D3D3D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


