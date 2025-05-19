import 'package:erohub/Screens/R&D_screen/submissionfrom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/Constants/Tcolors.dart';
import '../../Utils/Constants/const_texts.dart';

// Replace these with your actual screen files
import '../Screens/VizScreens/vizlevelscreens/viz_level_home.dart';
import '../Screens/Workpoint_screens/Quiz_screens/workpoint_Quiz_home.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? selectedReferral;
  final List<String> referrals = ['VIZ', 'INTERNSHIP', 'R&D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Tcolors.viz_login_color,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Text(
                        "Login Form",
                        style: const_text.bigwhitetext.copyWith(fontSize: 23.sp),
                      ),
                      const SizedBox(height: 10),
                      const Image(image: AssetImage('images/image 2.png')),
                    ],
                  ),
                ),
              ),

              // Back Arrow
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  ),
                ),
              ),

              // Form
              Positioned(
                top: 350,
                left: 20,
                right: 20,
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: const_text.Formtitle.copyWith(fontSize: 20.sp),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 250),
                          child: Divider(color: Tcolors.viz_login_color, thickness: 3),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email ID',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.mail, color: Tcolors.viz_login_color),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock, color: Tcolors.viz_login_color),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Type",
                            prefixIcon: Icon(Icons.person, color: Tcolors.viz_login_color),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: selectedReferral,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          selectedItemBuilder: (BuildContext context) {
                            return referrals.map((ref) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(ref, style: const TextStyle(color: Colors.black)),
                              );
                            }).toList();
                          },
                          items: referrals.map((ref) {
                            final bool isSelected = selectedReferral == ref;
                            return DropdownMenuItem<String>(
                              value: ref,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected ? Tcolors.viz_login_color : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  ref,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedReferral = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Login Type';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Submit Button
              Positioned(
                bottom: 3.h,
                left: 0,
                right: 0,
                child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        Widget? destination;

                        switch (selectedReferral) {
                          case 'VIZ':
                            destination = const VizLevelHome();
                            break;
                          case 'INTERNSHIP':
                            destination = const workpoint_Quiz_Home();
                            break;
                          case 'R&D':
                            destination = const Submissionfrom();
                            break;
                        }

                        if (destination != null) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Success',
                            text: 'Login Successful!',
                            confirmBtnText: 'OK',
                            onConfirmBtnTap: () {
                              Navigator.of(context, rootNavigator: true).pop(); // Dispose alert
                              Get.to(destination); // Navigate
                            },
                          );
                        }
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops',
                          text: 'Login Failed! Please check your credentials.',
                          confirmBtnText: 'Try Again',
                          onConfirmBtnTap: () {
                            Navigator.of(context, rootNavigator: true).pop(); // Dispose alert
                          },
                        );
                      }
                    },
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Tcolors.viz_login_color,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5)],
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.figtree(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
