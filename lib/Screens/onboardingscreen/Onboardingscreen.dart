import 'dart:ui';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:erohub/Utils/Constants/images.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, WormEffect;
import '../../Utils/Constants/Tcolors.dart';
import '../Homescreen/Homescreen.dart';
import 'CustomWidget/GreenclipContainer.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              buildOnboardingPage(
                image: Timages.onboardimage1,
                title: const_text.onboradingtitle1,
                onNext: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              buildOnboardingPage(
                image: Timages.onboardimage2,
                title: const_text.onboradingtitle2,
                onNext: () {

                  Get.to(Homescreen());
                },
              ),
            ],
          ),
          // Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                _controller.animateToPage(
                  1, // Go to second (last) page
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
/////////////////////////
  Widget buildOnboardingPage({
    required String image,
    required String title,
    required VoidCallback onNext,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: Tcolors.Welcomebackgroundcolor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: _controller,
              count: 2, // Only 2 pages now
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 20,
                activeDotColor: Colors.white,
                dotColor: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BottomCenterCutClipper(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Container(
                      width: 40.h,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: Tcolors.onboadcontainercolor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,bottom: 20),
                          child: Text(
                            title,
                            style: GoogleFonts.abel(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 35.h / 2,
                  child: GestureDetector(
                    onTap: onNext,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Tcolors.arrowcontainercolor,
                        borderRadius: BorderRadius.circular(300),
                      ),
                      child: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

