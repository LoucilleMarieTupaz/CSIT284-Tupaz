import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRetake,
  });

  final void Function() onRetake;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
          'questions_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getSummaryData().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height:30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 81, 46, 142),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: QuestionsSummary(getSummaryData()),
            ),
            const SizedBox(height:30),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor:Colors.white,
              ),
              icon: const Icon(Icons.restart_alt),
              onPressed: onRetake, 
              label: const Text('Retake Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}