import 'package:avd_basics/questions_summary/questions_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final checkCorrectAnswer = itemData['User_answer'] == itemData['Correct_answer'];

    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            // สัญลักษณ์ " : " ในที่นี้เป็นส่วนของการกำหนดค่า (property assignment) ที่ใช้ในการสร้าง instance ของ widget และส่งข้อมูลไปยัง widget นั้น ๆ ในการกำหนดค่า properties ของมัน.
            // isCorrectAnswer เป็น true หรือ flase เราจะรู้ได้จากการตัวแปร checkCorrectAnswer โดยจะส่งเป็น true หรือ flase
            isCorrectAnswer: checkCorrectAnswer,
            // ส่งตัวเลขที่เป็นจำนวนข้อคำถาม
            questionIndex: itemData['Question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['Question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(itemData['User_answer'] as String,
                style: const TextStyle(color: Color.fromARGB(255, 202, 171, 252),),),
              Text(itemData['Correct_answer'] as String,
                style: const TextStyle(color: Color.fromARGB(255, 181, 254, 246),),),
            ],
          ),),
        ],
      ),
    );

  }
}