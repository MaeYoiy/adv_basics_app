import 'package:avd_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:avd_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // "?" เพื่อบอกว่า activeScreen สามารถ contain Widget or Null
  var activeScreen = 'start-screen';

  // ถูก call ทันทีหลังจากสร้าง object
  // @override
  // void initState() {
  //   super.initState();
  //   // สามารถเก็บ Widget StartScreen ไว้ในตัวแปรได้ เพราะ Widget เป็น Object
  //   activeScreen = StartScreen(switchScreen);
  // }

  // Link to Next Page
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 128, 72, 225),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

// `startQuiz` ในที่นี้เป็นฟังก์ชันที่ถูกนำมาใช้ใน constructor ของ `StartScreen`. ตัวอย่างเดิมที่คุณให้มามีความสัมพันธ์ดังนี้:

// 1. `Quiz` คือ Widget หลักที่ถูกสร้างขึ้นใน `main.dart` หรือที่ไหนก็ตามที่คุณเรียกใช้ `Quiz`.
// 2. เมื่อ `Quiz` ถูกสร้าง, `activeScreen` ถูกกำหนดค่าให้เป็น `StartScreen` ด้วยการเรียก `StartScreen(switchScreen)`. นี่คือครั้งแรกที่ `startQuiz` ถูกใช้.
// 3. `switchScreen` คือฟังก์ชันที่ถูกส่งไปยัง `StartScreen` ผ่านพารามิเตอร์ `startQuiz`. ฟังก์ชันนี้ถูกเรียกเมื่อผู้ใช้กดปุ่ม "Start Quiz" ใน `StartScreen`.
// 4. เมื่อ `switchScreen` ถูกเรียก, มีการเรียก `setState` ซึ่งทำให้โปรแกรมทำการ build ใหม่.
// 5. ใน `build` method ของ `Quiz`, `activeScreen` ถูกให้ค่าเป็น `QuestionScreen()` ทำให้ Widget ที่แสดงผลเปลี่ยนจาก `StartScreen` เป็น `QuestionScreen`.

// นั่นคือเมื่อผู้ใช้กด "Start Quiz" ในหน้า StartScreen, โปรแกรมจะเปลี่ยน state และ Widget ที่แสดงผลจะเปลี่ยนจาก StartScreen เป็น QuestionScreen ตามที่ได้ถูกกำหนดไว้ใน `switchScreen` ซึ่งจะถูกเรียกเมื่อกดปุ่มใน StartScreen.
