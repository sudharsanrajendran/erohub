
import 'package:flutter/material.dart';
class BottomCenterCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double borderRadius = 50.0;
    const double notchRadius = 70.0;

    final path = Path();

    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    path.lineTo(size.width, size.height - borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - borderRadius, size.height);
    path.lineTo(size.width / 2 + notchRadius, size.height);
    path.arcToPoint(
      Offset(size.width / 2 - notchRadius, size.height),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(borderRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}