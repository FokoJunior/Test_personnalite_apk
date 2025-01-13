
class Question {
  final String text;
  final List<String> options;
  int selectedOptionIndex;

  Question({
    required this.text,
    required this.options,
    this.selectedOptionIndex = -1, 
  });
}