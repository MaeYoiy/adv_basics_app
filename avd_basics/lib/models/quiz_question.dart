// ไม่มีการ extends เพราะไม่ใช้ widget
// แต่เป็นพิมพ์เขียวสำหรับ questions.dart
class QuizQuestion {
  // function constructor ที่สามารถนำกลับมาใช้ใหม่ได้
  const QuizQuestion(this.text, this.answers);

  // this.text มีไว้เพื่อ map กับตัวแปร text ด้านล่างนี้
  final String text;
  // List ของ String
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;

  }
}
