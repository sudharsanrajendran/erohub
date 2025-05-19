import 'package:erohub/Screens/StadyMaterial/Studymaterialscreen/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:erohub/GlobalWidget/Homeicon.dart';
import 'package:sizer/sizer.dart';
import 'Widget/customStudyList.dart'; // Import video player screen

class StudymaterialPage extends StatelessWidget {
  const StudymaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: homeicon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(  // Stack to position the container and fab
        children: [
          Column(
            children: [
              // Top fixed container
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Tcolors.studeymaterialappbar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Sized image with constraints
                          SizedBox(
                            height: 100, // adjust height
                            child: const Image(
                              image: AssetImage('images/image 16.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 12),
                          // Text info
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Study Material'.toUpperCase(),
                                style: const_text.bigwhitetext.copyWith(fontSize:15.spa)
                              ),
                              Text(
                                'Let’s Dive into Learning!',
                                style: const_text.smallwhite.copyWith(fontSize:12.spa)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Back Arrow
                    Positioned(
                      top: 40,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable content below the fixed container
              Expanded(
                child: SingleChildScrollView(  // This will allow scrolling
                  child: Column(
                    children: [
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                      Customstudylist(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // White Container at the bottom of the screen
          Positioned(
            bottom: 0,  // This positions it at the bottom
            left: 0,
            right: 0,
            child: Container(
                height: 100,  // Height of the white container
                color: Colors.white
            ),
          ),

          // Green container with centered play button
        ],
      ),
    );
  }
}
