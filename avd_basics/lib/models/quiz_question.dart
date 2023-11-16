// ไม่มีการ extends เพราะไม่ใช้ widget
class QuizQuestion {
  // function constructor ที่สามารถนำกลับมาใช้ใหม่ได้
  const QuizQuestion(this.text, this.answer);

  // this.text มีไว้เพื่อ map กับตัวแปร text ด้านล่างนี้
  final String text;
  // List ของ String
  final List<String> answer;
}
