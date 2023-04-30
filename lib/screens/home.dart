import 'package:flutter/material.dart';
import 'package:quiz_app/data/sample_questions.dart';
import 'package:quiz_app/screens/cover_screen.dart';
import 'package:quiz_app/screens/result.dart';
import 'package:quiz_app/screens/show_question.dart';

enum ScreenType {
  CoverScreen,
  QuestionScreen,
  ResultScreen
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScreenType screenType = ScreenType.CoverScreen;
  List<Map> responseArray = [];
  Map resultsSummary = {};

  void startQuiz(){
    setState(() {
      responseArray = [];
      resultsSummary = {};
      screenType = ScreenType.QuestionScreen;
    });
  }

  void submitResponse(int questionId, String response){
    responseArray.add({'questionId': questionId, 'response': response});
  }

  void showResult(){
    resultsSummary = SampleQuestions().testSummary(responseArray);
    setState(() {
      screenType = ScreenType.ResultScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget display;
    switch(screenType){
      case ScreenType.CoverScreen:
        display = CoverScreen(startQuiz: startQuiz);
        break;
      case ScreenType.QuestionScreen:
        display = ShowQuestion(submitResponse: submitResponse, showResult: showResult,);
        break;
      case ScreenType.ResultScreen:
        display =  Result(resultsSummary: resultsSummary, startQuiz: startQuiz);
        break;
    } 
    return Scaffold(
      backgroundColor: const Color.fromARGB(50, 122, 215, 15),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: display
      ),
    );
  }
}