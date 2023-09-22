import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result.dart';
import 'package:quiz/start.dart';
import 'package:quiz/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz2();
  }
}

class _Quiz2 extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'activeScreen';

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question';
    });
  }

  void switchScreen2() {
    setState(() {
      activeScreen = 'activeScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question') {
      screenWidget = Question(onScreenAnswer: chooseAnswer);
    }
    if (activeScreen == 'result') {
      screenWidget = Result(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
