import 'package:avd_basics/answer_button.dart';
import 'package:avd_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // เป็นวิธีที่คุณส่งข้อมูลกลับไปยัง widget หรือตัวผู้ใช้หลักที่เรียก answerQuestion.
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // บอกว่าเพื่อดำเนินการ build method อีกครั้ง
    setState(() {
      currentQuestionIndex++;
    });

  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // double.infinity ทำให้ width ยาวมากที่สุดเท่าที่จะยาวได้
      width: double.infinity,
      child: Container(
        // EdgeInsets.all(40) -> เพื่มช่องว่าง margin ทุกทิศทาง บน ล่าง ซ้าย ขวา
        margin: const EdgeInsets.all(40),
        child: Column(
          // Vertical
          mainAxisAlignment: MainAxisAlignment.center,
          // Horizon
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // ยืดแนวนอนให้สุดหน้าจอ
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // ... จะรับค่าทั้งหมดใน List หรือ Iterable และดึงออกจาก List โดยจะได้ค่าเดียวและคั่นด้วยเครื่องหมายจุลภาค
            ...currentQuestion.getSuffledAnswers().map((eAnswer) {
              return AnswerButton(answerText: eAnswer, onTap: () {
                answerQuestion(eAnswer);
              },);
            }),
          ],
        ),
      ),
    );
  }
}
