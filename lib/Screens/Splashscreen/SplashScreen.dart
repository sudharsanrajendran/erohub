import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Constants/Tcolors.dart';
import '../../Utils/Constants/images.dart';
import '../onboardingscreen/Onboardingscreen.dart';
import 'Customwidget/gradientText.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the Onboarding screen after 3 seconds.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboardingscreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Tcolors.Welcomebackgroundcolor, // Background gradient
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular logo
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        blurRadius: 25,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    Timages.logo,
                    height: 20.h, // Adjust size as needed
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              // Logo text
              GradientText(
                text: "ERP HUB TECHNOLOGIES",
                style: GoogleFonts.kavoon(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.white.withOpacity(0.8),
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                gradient: Tcolors.logotext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
