import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../GlobalWidget/LoginScreen.dart';
import '../../Utils/Constants/const_texts.dart'; // Add this dependency

class ReviewScreen extends StatelessWidget {
  final String pdfFilePath;

  const ReviewScreen({super.key, required this.pdfFilePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const Loginscreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: Text(
                      "Logout",
                      style: const_text.smallwhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF396FE3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child: Column(
                children: [
                  Text("Hiii", style: const_text.bigwhitetext),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset('images/twemoji_direct-hit.png'),
                          SizedBox(height: 20),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Department: ", style: const_text.smalGRAY),
                                SizedBox(height: 20),
                                Text("Organization: ", style: const_text.smalGRAY),
                                SizedBox(height: 20),
                                Text("Domain: ", style: const_text.smalGRAY),
                                SizedBox(height: 20),
                                Text("Category: ", style: const_text.smalGRAY),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => PDFViewPage(pdfFilePath: pdfFilePath));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                              child: Text(
                                "Read More",
                                style: const_text.smallwhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PDFViewPage extends StatelessWidget {
  final String pdfFilePath;

  const PDFViewPage({super.key, required this.pdfFilePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF View")),
      body: PDFView(
        filePath: pdfFilePath,
      ),
    );
  }
}
