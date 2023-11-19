import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // key ส่งต่อไปยัง super class
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Images
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),

          const SizedBox(height: 80),

          //
          Text(
            'Learn flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 204, 187, 187),
              fontSize: 24,
            )
          ),

          const SizedBox(height: 30),

          // Button
          ElevatedButton.icon(
            //เก็บ object เป็น QuestionScreen เมื่อกดปุ่มก็จะไปที่หน้า QuestionScreen เลย
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
