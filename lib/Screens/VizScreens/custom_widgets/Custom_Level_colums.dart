import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/Constants/Tcolors.dart';
import '../../../Utils/Constants/const_texts.dart';

class CustomLevelColumn extends StatelessWidget {
  final String image;
  final String level;
  final String levelname;
  final String statusText;
  final VoidCallback ontap;

  const CustomLevelColumn({
    super.key,
    required this.image,
    required this.level,
    required this.levelname,
    required this.ontap,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon Circle
        Container(
          height: 9.h,
          width: 9.h,
          decoration: BoxDecoration(
            gradient: Tcolors.VIZBUTTON,
            borderRadius: BorderRadius.circular(4.5.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(1.5.w),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 1.5.h),

        // Level title
        Text(
          level,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(height: 2.h),

        // Level description
        Text(
          levelname,
          textAlign: TextAlign.center,
          style: GoogleFonts.lexend(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),

        SizedBox(height: 2.h),


        SizedBox(height: 1.h),

        // Button
        GestureDetector(
          onTap: ontap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            decoration: BoxDecoration(
              gradient: Tcolors.VIZBUTTON,
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Text(
              statusText,
              style: const_text.smallwhite.copyWith(fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
