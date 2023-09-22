import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/ansStyle.dart';
import 'package:quiz/data/questions.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.onScreenAnswer,
  });

  final void Function(String answer) onScreenAnswer;
  @override
  State<Question> createState() {
    return _QuestionS();
  }
}

class _QuestionS extends State<Question> {
  var currentQuesIndex = 0;
  void answerQues(String selectedAnswer) {
    widget.onScreenAnswer(selectedAnswer);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuesIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 164, 113, 222),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((item) {
              return Ans(
                answerText: item,
                onTap: () {
                  answerQues(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
