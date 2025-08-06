import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:flutter_quiz/start_screen.dart';

import 'data/questions.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  final List<String> selectedAnswers = [];

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "start-screen";
        selectedAnswers.clear();
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: startAlignment,
              end: endAlignment,
              colors: [
                Color.fromARGB(255, 103, 6, 136),
                Color.fromARGB(255, 42, 7, 91),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
