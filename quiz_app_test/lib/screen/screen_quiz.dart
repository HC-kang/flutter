import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quiz_app_test/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz>? quizs;
  QuizScreen({this.quizs});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
                physics: NeverScrollableScrollPhysics(),
                loop: false,
                itemCount: widget.quizs!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildQuizCard(widget.quizs[index], width, height);
                })),
      ),
    );
  }
}
