import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Text(((data['Question_index'] as int) + 1).toString()), //.toString() คือ แปลงจาก int ของเก่านี้ ให้เป็น String
              Expanded(
                child: Column(
                  children: [
                    Text(data['Question'] as String),
                    const SizedBox(height: 5,),
                    Text(data['User_answer'] as String),
                    Text(data['Correct_answer'] as String),
                  ],
                ),
              ),
            ],);
          },).toList(), //iterable -> list
        ),
      ),

    );

  }
}