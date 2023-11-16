import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      // double.infinity ทำให้ width ยาวมากที่สุดเท่าที่จะยาวได้
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question...'),
          const SizedBox(height: 30),
          FilledButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
        ],
      ),
    );
  }
}
