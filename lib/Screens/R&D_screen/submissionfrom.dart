import 'package:file_picker/file_picker.dart';
import 'package:erohub/Screens/R&D_screen/ReviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:erohub/GlobalWidget/LoginScreen.dart';
import '../../Utils/Constants/const_texts.dart';

class Submissionfrom extends StatefulWidget {
  const Submissionfrom({super.key});

  @override
  State<Submissionfrom> createState() => _SubmissionfromState();
}

class _SubmissionfromState extends State<Submissionfrom> {
  String? _filePath;

  Future<void> _pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'ppt', 'pptx'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

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
                    Get.defaultDialog(
                      title: "Exit App",
                      middleText: "Do you want to close the app?",
                      textCancel: "No",
                      textConfirm: "Yes",
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        SystemNavigator.pop();
                      },
                    );
                  },
                ),
                GestureDetector(
                  onTap: () => Get.offAll(() => const Loginscreen()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: Text("Logout", style: const_text.smallwhite),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    children: [
                      Text(
                        "Research and development \nproposal submission form",
                        style: const_text.bigwhitetext.copyWith(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text("Upload file", style: const_text.paragaraph),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: _pickPDF,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 4)
                                            ],
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6.w, vertical: 1.h),
                                          child: Text(
                                            "Choose file",
                                            style: const_text.paragaraph.copyWith(
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _filePath != null
                                              ? "Selected"
                                              : "PDF / PPT",
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 19),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 90),
                      GestureDetector(
                        onTap: () {
                          if (_filePath != null) {
                            Get.to(() => ReviewScreen(pdfFilePath: _filePath!));
                          } else {
                            Get.snackbar("Error", "Please choose a file first",
                                backgroundColor: Colors.redAccent,
                                colorText: Colors.white);
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: const_text.bigwhitetext.copyWith(
                                color: const Color(0xFF396FE3), fontSize: 18.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 300,
                child: Image.asset(
                  'images/r&d.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
