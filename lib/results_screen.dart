import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestart, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  final void Function() onRestart;

  // get summaryData
  // is used to denote summaryData is a function
  // that is a property of the class
  // we can use it like member variable call
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return (data["user_answer"] == data["correct_answer"]);
    }).length;

    // arrow function (optional)
    // summaryData
    //     .where((data) => (data["user_answer"] == data["correct_answer"]))
    //     .length;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: onRestart,
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
