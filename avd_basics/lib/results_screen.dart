
import 'package:flutter/material.dart';
import 'package:avd_basics/data/questions.dart';
import 'package:avd_basics/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  // หากเราต้องการรับข้อมูลบางอย่างใน widget ถ้าเราต้องการส่งข้อมูลบางอย่างไปยัง widget เราต้องยอมรับ argument super.key ใน function constructor
  // ตัวอย่างเช่น เพื่อใช้มันใน method build เราต้องเพิ่มคุณสมบัติพิเศษให้กับคลาส ResultScreen ด้วย
  // อย่าง
  final List<String> chosenAnswers;

  // Method
  // Map มีค่า Key=String กับ Value=Object
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for ( var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        // Question_index == key, i == value ใน concept Map
        'Question_index': i,
        'Question': questions[i].text,
        // answer[0] เป็นคำตอบที่ถูกต้องเสมอ
        'Correct_answer': questions[i].answers[0],
        'User_answer': chosenAnswers[i],
      },);
    }

    return summary;

  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    //where เป็นเมทอดของ Iterable (เช่น List, Set) ที่ใช้สำหรับกรองข้อมูลตามเงื่อนไขที่กำหนด.
    final numCorrectQuestions = summaryData.where((data) {
      //ถ้าค่าที่อยู่ใน 'User_answer' เท่ากับค่าที่อยู่ใน 'Correct_answer', ฟังก์ชันจะคืนค่า true, ซึ่งหมายความว่าข้อมูลนี้จะถูกเก็บไว้ในผลลัพธ์.
      return data['User_answer'] == data['Correct_answer'];
    }).length; //หลังจากที่ข้อมูลถูกกรองด้วย where, .length ถูกใช้เพื่อนับจำนวนข้อมูลที่ผ่านเงื่อนไข. นั่นคือ, numCorrectQuestions จะเก็บจำนวนข้อมูลที่มีค่า 'User_answer' เท่ากับ 'Correct_answer' ใน summaryData.

    //function arrow (มีค่าเหมือนกับโค้ดด้านบน)
    // final numCorrectQuestions = summaryData.where((data) => data['User_answer'] == data['Correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',),
            const SizedBox(height: 30,),
            // ส่วนที่สามารถเลื่อนได้
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed: () {}, child: const Text('Restart quiz'),),
          ],
        ),
      ),
    );
  }
}