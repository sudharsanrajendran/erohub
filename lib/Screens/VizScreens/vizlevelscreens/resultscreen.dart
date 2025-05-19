import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Questions.dart';
import 'level2/level2_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List<int?> selectedAnswers;
  final List<Question> questions;

  ResultScreen({
    required this.score,
    required this.selectedAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image

          SizedBox.expand(
            child: Image.asset(
              'images/vizbackground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Purple overlay
          Container(color: Colors.purple.withOpacity(0.4)),
          // Foreground content



          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0636F4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Quiz Completed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: LinearProgressIndicator(
                            value: score / questions.length,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your Score Is',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 16),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Color(0xFF0636F4),
                          child: Text(
                            '$score/${questions.length}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Scoreboard Table
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Scoreboard',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.grey, width: 1.5),
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(color: Colors.grey[300]),
                              children: [
                                tableCell('Question', true),
                                tableCell('Your Answer', true),
                                tableCell('Correct Answer', true),
                              ],
                            ),
                            for (int i = 0; i < questions.length; i++)
                              TableRow(
                                decoration: BoxDecoration(
                                  color: selectedAnswers[i] == null
                                      ? Colors.grey[100]
                                      : selectedAnswers[i] == questions[i].correctIndex
                                      ? Colors.green[100]
                                      : Colors.red[100],
                                ),
                                children: [
                                  tableCell('Q${i + 1}: ${questions[i].questionText}'),
                                  tableCell(
                                    selectedAnswers[i] != null
                                        ? questions[i].options[selectedAnswers[i]!]
                                        : 'N/A',
                                    false,
                                    selectedAnswers[i] == null
                                        ? Colors.black
                                        : selectedAnswers[i] == questions[i].correctIndex
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  tableCell(
                                    questions[i].options[questions[i].correctIndex],
                                    false,
                                    Colors.green[900],
                                  ),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(LevelTwoScreen(onLevelComplete: () {}));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0636F4),
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Continue to Level 2',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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

  Widget tableCell(String text, [bool isHeader = false, Color? textColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? (isHeader ? Colors.black : Colors.black87),
          ),
        ),
      ),
    );
  }
}
