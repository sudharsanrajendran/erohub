import 'package:flutter/material.dart';
import '../Utils/Constants/Tcolors.dart';

class homeicon extends StatelessWidget {
  const homeicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66, // slightly larger to act as a border
      width: 66,
      padding: const EdgeInsets.all(3), // border thickness
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: Tcolors.Homeiconcolor, // same gradient as icon
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: () {},
          icon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return Tcolors.Homeiconcolor.createShader(bounds);
            },
            child: const Icon(
              Icons.home,
              size: 38,
              color: Colors.white, // Let ShaderMask apply gradient
            ),
          ),
        ),
      ),
    );
  }
}
