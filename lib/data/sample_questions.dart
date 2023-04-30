import 'package:quiz_app/modals/question.dart';

class SampleQuestions {

  final List<Question> _questions = [
      const Question(id: 0, text: "What is the capital of India?", options: ["Delhi", "Mumbai", "Jaipur", "Chennai"]),
      const Question(id: 1, text: "What is the capital of Canada?", options: ["Ottawa", "Montreal", "Winnepeg", "Toronto"]),
      const Question(id: 2, text: "What is the capital of Germany?", options: ["Berlin", "Wolfsberg", "Munich", "Frankfurt"]),
      const Question(id: 3, text: "What is the capital of France?", options: ["Paris", "Nice", "Bordeaux", "Marseille"]),
    ];

  List<Question> get getQuestions{
    return _questions;
  }

  Map testSummary(List<Map> responseArray){
    int score = 0;
    List<Map> summaryArr = [];
    for (int i = 0; i < responseArray.length; i++){
      String questionText = _questions[i].text;
      String correctOption = _questions[i].options[0];
      String selectedOption = responseArray[i]['response']; 
      if(correctOption == selectedOption){
        score++;
      } 
      summaryArr.add({
        'index': i+1,
        'questionText': questionText,
        'correctOption': correctOption,
        'selectedOption': selectedOption
      });
    }
    return {
      'score': score,
      'summaryArr': summaryArr
    };
  }

}