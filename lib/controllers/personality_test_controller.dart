
import '../models/question.dart';

class PersonalityTestController {
  List<Question> questions;

  PersonalityTestController() : questions = _loadQuestions();

  static List<Question> _loadQuestions() {
    return [
      Question(
        text: "Je me fais facilement des amis.",
        options: ["Pas du tout", "Pas d'accord", "Neutre", "D'accord", "Tout à fait"],
      ),
      Question(
        text: "J’ai beaucoup d’imagination.",
        options: ["Pas du tout", "Pas d'accord", "Neutre", "D'accord", "Tout à fait"],
      ),
      Question(
        text: "Je fais confiance aux autres.",
        options: ["Pas du tout", "Pas d'accord", "Neutre", "D'accord", "Tout à fait"],
      ),
      Question(
        text: "J’accomplis les tâches avec succès.",
        options: ["Pas du tout", "Pas d'accord", "Neutre", "D'accord", "Tout à fait"],
      ),
      Question(
        text: "Je me fâche facilement.",
        options: ["Pas du tout", "Pas d'accord", "Neutre", "D'accord", "Tout à fait"],
      ),

    ];
  }

  void selectOption(int questionIndex, int optionIndex) {
    questions[questionIndex].selectedOptionIndex = optionIndex;
  }

  int calculateScore() {
    int totalScore = 0;
    for (var question in questions) {
      if (question.selectedOptionIndex != -1) {
        totalScore += question.selectedOptionIndex + 1; // Les options sont indexées de 0 à 4
      }
    }
    return totalScore;
  }

  String getPersonalityType(int score) {
    if (score < 15) {
      return "Ouverture à l’expérience";
    } else if (score < 25) {
      return "Conscience professionnelle";
    } else {
      return "Extraversion";
    }
  }
}
