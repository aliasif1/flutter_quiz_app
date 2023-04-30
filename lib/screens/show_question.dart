import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/sample_questions.dart';
import 'package:quiz_app/modals/question.dart';
  // void submitResponse(int questionId, String response){
  //   responseArray.add({'questionId': questionId, 'response': response});
  // }

  // void showResult(){


class ShowQuestion extends StatefulWidget {
  final Function(int questionId, String response) submitResponse;
  final Function() showResult;

  const ShowQuestion({super.key, required this.submitResponse, required this.showResult});

  @override
  State<ShowQuestion> createState() => _ShowQuestionState();
}

class _ShowQuestionState extends State<ShowQuestion> {
  int index = 0;
  List<Question> allQuestions = SampleQuestions().getQuestions;

  void saveResponseAndNextQuestion(int questionId, String response){
    // save the response
    widget.submitResponse(questionId, response);

    // see if all questions are over
    if(index == allQuestions.length - 1){
      widget.showResult();
      return;
    } 

    // go to next question
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question q = allQuestions[index];
    List<String> options = [...q.options];
    options.shuffle();
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${q.id + 1}. ${q.text}',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70)),
          ),
          const SizedBox(
            height: 30,
          ),
          ...options.map((option) => Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: ()=>saveResponseAndNextQuestion(q.id, option),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.grey),
                child: Text(
                  option,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              )))
        ],
      ),
    );
  }
}
