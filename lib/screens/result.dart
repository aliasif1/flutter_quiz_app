import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  final Map resultsSummary;
  final Function() startQuiz;
  const Result(
      {super.key, required this.startQuiz, required this.resultsSummary});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered ${resultsSummary["score"]} out of ${resultsSummary["summaryArr"].length} questions correctly",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: (resultsSummary['summaryArr'] as List)
                  .map((e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['index'].toString(),
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70)),
                          ),
                          const SizedBox(width: 40,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['questionText'],
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70)),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  'Correct Answer: ${e['correctOption']}',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white70)),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  'Your Answer: ${e['selectedOption']}',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: e['selectedOption'] == e['correctOption'] ? Colors.blue : Colors.red)),
                                ),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          )
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton.icon(
          onPressed: startQuiz,
          label: Text(
            "Retake Quiz",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70)),
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white70,
          ),
          style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30)),
        )
      ],
    );
  }
}
