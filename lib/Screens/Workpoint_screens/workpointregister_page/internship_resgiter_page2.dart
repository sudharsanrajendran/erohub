import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WorkpointFormPage2 extends StatefulWidget {
  const WorkpointFormPage2({super.key});

  @override
  State<WorkpointFormPage2> createState() => _WorkpointFormPage2State();
}

class _WorkpointFormPage2State extends State<WorkpointFormPage2> {
  final _formKey = GlobalKey<FormState>();
  String? selectedPosition;
  String? selectedReferral;
  bool isPolicyAccepted = false;
  String selectedPlan = 'silver\n249 inr';
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final List<String> positions = [
    'Finance / Account',
    'Information Technology',
    'Logistics',
    'HRMS',
    'Marketing',
    'Supply Chain Management'
  ];

  final List<String> referrals = ['Website', 'Social Media', 'Others'];

  final List<String> plans = [
    'general\n249 inr',
    'silver\n249 inr',
    'gold \n249 inr',
    'plantinum\n249 inr'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Rectangle 11.png"), // ✅ your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
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
                          color: Colors.white, // ✅ updated
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 10)),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.person,
                          color:  Colors.white, // ✅ updated
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20),bottom:Radius.circular(20)),

                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "INTERNSHIP DETAILS (if any)",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// Position Dropdown
                          DropdownButtonFormField<String>(
                            decoration:
                            const InputDecoration(labelText: "Position Applying For"),
                            value: selectedPosition,
                            items: positions
                                .map((pos) =>
                                DropdownMenuItem(value: pos, child: Text(pos)))
                                .toList(),
                            onChanged: (value) =>
                                setState(() => selectedPosition = value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a position';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "INTERNSHIP PLAN",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// Plan ChoiceChips
                          Wrap(
                            spacing: 10,
                            children: plans.map((plan) {
                              return ChoiceChip(
                                label: Text(plan),
                                selected: selectedPlan == plan,
                                selectedColor: const Color(0xFF0A63B3), // ✅ updated
                                onSelected: (_) =>
                                    setState(() => selectedPlan = plan),
                                labelStyle: TextStyle(
                                  color: selectedPlan == plan
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _dobController,
                                  readOnly: true,
                                  onTap: () => _selectDate(context),
                                  decoration: const InputDecoration(
                                    labelText: 'Available Date',
                                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 40),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration:
                                  const InputDecoration(labelText: "Referral From"),
                                  value: selectedReferral,
                                  items: referrals
                                      .map((ref) =>
                                      DropdownMenuItem(value: ref, child: Text(ref)))
                                      .toList(),
                                  onChanged: (value) =>
                                      setState(() => selectedReferral = value),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a referral source';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),

                          // Message Field
                          TextFormField(
                            controller: _messageController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Message',
                              filled: true,
                              fillColor: const Color(0xFFF0F0F0),
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Color(0xFF0A63B3), width: 2), // ✅ updated
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a message';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 14.h),

                          // Policy Checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: isPolicyAccepted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isPolicyAccepted = value ?? false;
                                  });
                                },
                                activeColor: const Color(0xFF0A63B3), // ✅ updated
                              ),
                              Expanded(
                                child: Text(
                                  'I consent to the processing of my personal data entered above for ERP to contact me..',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5.h),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Handle form submission
                                print("Form Submitted!");
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A63B3), // ✅ updated
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black, blurRadius: 10)
                                ],
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
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
