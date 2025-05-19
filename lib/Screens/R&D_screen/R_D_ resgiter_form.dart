import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../GlobalWidget/LoginScreen.dart';
import '../../Services/Commancontrollers.dart'; // Adjust import path if needed

class RDRegisterForm extends StatefulWidget {
  const RDRegisterForm({super.key});

  @override
  State<RDRegisterForm> createState() => _RDRegisterFormState();
}

class _RDRegisterFormState extends State<RDRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> categories = ['Fresher', 'Graduate/Student', 'Referral Name'];
  String? selectedCategory;




  @override
  void initState() {
    super.initState();
  }
  final fullNameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final altPhoneController = TextEditingController();
  final deptController = TextEditingController();
  final orgController = TextEditingController();
  final domainController = TextEditingController();
  final projectTitleController = TextEditingController();
  final abstractController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    altPhoneController.dispose();
    deptController.dispose();
    orgController.dispose();
    domainController.dispose();
    projectTitleController.dispose();
    abstractController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     RDFormController rdFormController =Get.put(RDFormController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            // Back button
            Positioned(
              top: 10,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            // Title
            Positioned(
              top: 50,
              left: 12,
              child: Text(
                "R & D Register Form",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
            ),

            // Form Container
            Positioned.fill(
              top: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("images/Rectangle 11.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey.shade200),
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      formField("Full Name", fullNameController),
                                      formField("Mail Address", mailController, email: true),
                                      formField("Phone Number", phoneController, isPhone: true),
                                      formField("Alternate Number", altPhoneController, isPhone: true),
                                      formField("Department", deptController),
                                      formField("Organization", orgController),
                                      formField("Domain", domainController),
                                      categoryDropdown(),
                                      formField("R&D Project Title", projectTitleController),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Abstract Or Objection Of Your Finding On RND (150 Words)",
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: abstractController,
                                    maxLines: 6,
                                    validator: (value) =>
                                    value == null || value.isEmpty ? "Please enter an abstract" : null,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF396FE3),
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Store form details in GetX controller before navigating to Login screen

                              rdFormController.setFormData(department:deptController.text ,
                                  organization: orgController.text,
                                  domain: domainController.text,
                                  category:selectedCategory ?? '',);



                              Get.to(() => Loginscreen());
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Oops',
                                text: 'Please fill all fields correctly!',
                                confirmBtnText: 'Try Again',
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Send Your Message", style: const_text.smallwhite),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Input Field
  Widget formField(String label, TextEditingController controller, {bool email = false, bool isPhone = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) return "Required field";
              if (email && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Enter a valid email";
              if (isPhone && !RegExp(r'^\d{10}$').hasMatch(value)) return "Enter 10-digit number";
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // Category Dropdown
  Widget categoryDropdown() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth > 600
              ? MediaQuery.of(context).size.width / 2 - 40
              : double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Category", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (value) => setState(() => selectedCategory = value),
                validator: (value) => value == null ? "Please select a category" : null,
                items: categories
                    .map((cat) => DropdownMenuItem<String>(
                    value: cat,
                    child: Text(cat, style: TextStyle(color: Colors.black))))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
