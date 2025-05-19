import 'package:erohub/Screens/VizScreens/vizlevelscreens/Questions.dart';
import 'package:erohub/Screens/VizScreens/vizlevelscreens/resultscreen.dart';
import 'package:erohub/Utils/Constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    Question(questionText: 'What is 9 - 3?', options: ['8', '9', '6', '10'], correctIndex: 2),
    Question(questionText: 'What is 2 + 2?', options: ['3', '4', '5', '6'], correctIndex: 1),
    Question(questionText: 'What is 9 + 9?', options: ['17', '19', '18', '20'], correctIndex: 2),
  ];

  int currentIndex = 0;
  List<int?> selectedAnswers = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, null);
  }

  void nextQuestion() {
    if (selectedAnswers[currentIndex] == questions[currentIndex].correctIndex) {
      score++;
    }
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: score,
            selectedAnswers: selectedAnswers,
            questions: questions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          // Custom Back Button
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.all(20),
            child:SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('images/icons/quiztopimage.png', fit: BoxFit.cover),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0636F4),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${currentIndex + 1}/${questions.length}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Spacer(),
                                        CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 14,
                                          child: Center(
                                            child: Text(
                                              "30",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Divider(color: Color(0xFF0636F4), thickness: 2),
                                            SizedBox(height: 10),
                                            Text(question.questionText, style: const_text.bigblack),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ...List.generate(question.options.length, (i) {
                            final isSelected = selectedAnswers[currentIndex] == i;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: isSelected ? Colors.green : Colors.blue.shade50.withOpacity(0.5),
                                child: ListTile(
                                  title: Text(
                                    question.options[i],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  leading: Radio<int>(
                                    value: i,
                                    groupValue: selectedAnswers[currentIndex],
                                    onChanged: (val) {
                                      setState(() {
                                        selectedAnswers[currentIndex] = val;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: selectedAnswers[currentIndex] != null ? nextQuestion : null,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF54BE48),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '  Continue  ',
                                  style: const_text.smallwhite,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
