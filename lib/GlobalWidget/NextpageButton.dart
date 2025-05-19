import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Nextpagebutton extends StatelessWidget {
  const Nextpagebutton({super.key, required this.bgcolor,  this.ontap});

final Color bgcolor;
final ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){

        Get.to(ontap);
      },
      child: Container(
          height: 35,
          width: 120,
      decoration: BoxDecoration(color:bgcolor,
              border: Border.all(color: Colors.white,width: 3),
              borderRadius: BorderRadius.circular(100)
              ,boxShadow: [
            BoxShadow(color:Colors.grey,blurRadius: 5,)
          ]
          ),
            child: Center(child: Text("Nextpage >",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
        ),
    );
  }
}
