import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class GlassContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Widget? child;

  const GlassContainer({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: borderRadius,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}


class Iconcontainer extends StatelessWidget {
  const Iconcontainer({super.key, this.images, required this.title, this.ontap});
  final String? images;
  final String title;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 20.h,
          width: 20.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5FF).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child:Column(
            children: [
              Expanded(child: Image.asset(images!)),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }}

