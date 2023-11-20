import 'package:avd_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:avd_basics/start_screen.dart';
import 'package:avd_basics/data/questions.dart';
import 'package:avd_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // ตัวแปรที่เก็บ List ของคำตอบที่เราได้เลือกไว้
  List<String> selectedAnswer = [];

  // "?" เพื่อบอกว่า activeScreen สามารถ contain Widget or Null
  var activeScreen = 'start-screen';

  // ถูก call ทันทีหลังจากสร้าง object
  // @override
  // void initState() {
  //   super.initState();
  //   // สามารถเก็บ Widget StartScreen ไว้ในตัวแปรได้ เพราะ Widget เป็น Object
  //   activeScreen = StartScreen(switchScreen);
  // }

  // Start screen -> Questions screen
  void switchScreen() {
    //การเรียก setState ทำให้ Flutter รู้ว่า state ภายใน StatefulWidget ได้เปลี่ยนแปลงแล้ว และจะทำการ rebuild ตัวเอง.
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  // Questions screen -> Result screen
  void chooseAnswer (String answer) {
    selectedAnswer.add(answer);

    //เมื่อทำการเลือก answer เกิน list ของ questions แล้ว ให้ทำการไปยังหน้า result เลย
    if (selectedAnswer.length == questions.length) {

      setState(() {
        activeScreen = 'results-screen';
      });

    }
  }

  // Result screen -> Questions screen
  void restartQuiZ() {
    setState(() {
      // reset answer ที่เลือก
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    // ไปหน้าคำถาม (question_screen)
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer,);
    }

    //ไปหน้าผลลัพธ์ (results_screen)
    if (activeScreen == 'results-screen') {
      // ค่า input selectedAnswer นี้ จะถูกส่งไปยัง class/widget ResultScreen ที่อยู่ในไฟล์ results_screen.dart
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiZ,
      );
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
