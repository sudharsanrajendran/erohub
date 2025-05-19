import 'package:erohub/Utils/Constants/Tcolors.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import '../../../GlobalWidget/NextpageButton.dart';
import 'internship_resgiter_page2.dart';

class WorkpointFormPage1 extends StatefulWidget {
  const WorkpointFormPage1({Key? key}) : super(key: key);

  @override
  State<WorkpointFormPage1> createState() => _WorkpointFormPage1State();
}

class _WorkpointFormPage1State extends State<WorkpointFormPage1> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Nextpagebutton(
        bgcolor: Color(0xFF0A63B3),
          ontap: WorkpointFormPage2(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Rectangle 11.png'), // Replace with your path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back,color: Colors.white,),
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                          text: "Workpoint-EHT Register form",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 10)),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(Icons.person, color: Colors.white, size: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),

                // Form Container
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom:Radius.circular(20)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(const_text.internshipdeclare, style: const_text.fromheading),
                            const Divider(color: Colors.black),

                            // General Info
                            Text("GENERAL INFO", style: const_text.Formtitle),
                            Textformfiled(
                              labelText1: 'First Name',
                              labelText2: 'Last Name*',
                              validator1: (value) => value == null || value.isEmpty ? 'Enter first name' : null,
                              validator2: (value) => value == null || value.isEmpty ? 'Enter last name' : null,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(labelText: 'DOB*'),
                                    validator: (value) => value == null || value.isEmpty ? 'Enter date of birth' : null,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Gender*'),
                                      Row(
                                        children: ['Male', 'Female', 'Others'].map((String value) {
                                          return Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Radio<String>(
                                                  value: value,
                                                  groupValue: gender,
                                                  activeColor: Colors.deepPurple,
                                                  fillColor: MaterialStateProperty.all(Colors.black),
                                                  onChanged: (val) => setState(() => gender = val!),
                                                ),
                                                Text(value, style: const TextStyle(color: Colors.black)),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Education Info
                            Text('COMMUNICATION INFO', style: const_text.Formtitle),
                            Textformfiled(
                              labelText1: '10th*',
                              labelText2: 'Institution Name*',
                              validator1: (v) => v == null || v.isEmpty ? 'Enter 10th marks' : null,
                              validator2: (v) => v == null || v.isEmpty ? 'Enter 10th institution name' : null,
                            ),
                            Textformfiled(
                              labelText1: '12th*',
                              labelText2: 'Institution Name*',
                              validator1: (v) => v == null || v.isEmpty ? 'Enter 12th marks' : null,
                              validator2: (v) => v == null || v.isEmpty ? 'Enter 12th institution name' : null,
                            ),
                            Textformfiled(
                              labelText1: 'UG*',
                              labelText2: 'Institution Name*',
                              validator1: (v) => v == null || v.isEmpty ? 'Enter UG marks' : null,
                              validator2: (v) => v == null || v.isEmpty ? 'Enter UG institution name' : null,
                            ),
                            Textformfiled(
                              labelText1: 'PG*',
                              labelText2: 'Institution Name*',
                              validator1: (v) => v == null || v.isEmpty ? 'Enter PG marks' : null,
                              validator2: (v) => v == null || v.isEmpty ? 'Enter PG institution name' : null,
                            ),

                            const SizedBox(height: 20),

                            // Experience
                            Text("EXPERIENCE DETAILS (If Any)", style: const_text.Formtitle),
                            Textformfiled(
                              labelText1: 'Company Name*',
                              labelText2: 'Duration*',
                              validator1: (v) => v == null || v.isEmpty ? 'Enter company name' : null,
                              validator2: (v) => v == null || v.isEmpty ? 'Enter duration' : null,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Designation',
                                hintText: 'Designation',
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              ),
                              validator: (v) => v == null || v.isEmpty ? 'Enter designation' : null,
                            ),

                            const SizedBox(height: 20),

                            // Documents
                            Text("DOCUMENT REQUIRED (to be attached)", style: const_text.Formtitle),
                            const Choosefiled(title: 'Resume', title2: 'Photo'),
                            const Choosefiled(title: 'Aadhar Card', title2: 'Pan Card'),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Choosefiled & Textformfiled widgets stay unchanged
class Choosefiled extends StatelessWidget {
  const Choosefiled({
    super.key,
    required this.title,
    required this.title2,
  });

  final String title;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const_text.fromheading),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF0A63B3)
                    ),
                    child: Center(child: Text("choose file", style: const_text.smallwhite)),
                  ),
                ),
                const Divider(height: 20, thickness: 2.0),
              ],
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title2, style: const_text.fromheading),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF0A63B3)
                    ),
                    child: Center(child: Text("choose file", style: const_text.smallwhite)),
                  ),
                ),
                const Divider(height: 20, thickness: 2.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Textformfiled extends StatelessWidget {
  const Textformfiled({
    super.key,
    required this.labelText1,
    required this.labelText2,
    required this.validator1,
    required this.validator2,
  });

  final String labelText1;
  final String labelText2;
  final FormFieldValidator<String> validator1;
  final FormFieldValidator<String> validator2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText1,
              hintText: labelText1,
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            ),
            validator: validator1,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText2,
              hintText: labelText2,
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            ),
            validator: validator2,
          ),
        ),
      ],
    );
  }
}
