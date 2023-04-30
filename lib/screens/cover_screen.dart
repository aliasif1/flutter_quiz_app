import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverScreen extends StatelessWidget {
  final Function() startQuiz;
  const CoverScreen({super.key, required this.startQuiz});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Quiz It",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70)),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/question.jpg', width: 300),
          const SizedBox(
            height: 40,
          ),
          TextButton.icon(
            onPressed: startQuiz,
            label: Text(
            "Start Quiz",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70)),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white70,),
            style: TextButton.styleFrom(backgroundColor: Colors.grey, padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30)),
          )
        ],
      ),
    );
  }
}
