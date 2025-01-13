
import 'package:flutter/material.dart';
import '../controllers/personality_test_controller.dart';
import '../models/question.dart';
import 'result_screen.dart';

class PersonalityTestScreen extends StatefulWidget {
  final PersonalityTestController controller;

  PersonalityTestScreen({required this.controller});

  @override
  _PersonalityTestScreenState createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen> {
  int currentQuestionIndex = 0;

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.controller.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Naviguer vers la page des résultats
        int score = widget.controller.calculateScore();
        String personalityType = widget.controller.getPersonalityType(score);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(personalityType: personalityType),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.controller.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test de Personnalité',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Question
            Text(
              currentQuestion.text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Options
            Expanded(
              child: ListView.separated(
                itemCount: currentQuestion.options.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: RadioListTile<int>(
                      title: Text(
                        currentQuestion.options[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      value: index,
                      groupValue: currentQuestion.selectedOptionIndex,
                      onChanged: (int? value) {
                        setState(() {
                          widget.controller.selectOption(currentQuestionIndex, value!);
                        });
                      },
                      activeColor: Colors.deepPurple,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Bouton Suivant/Terminer
            Center(
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < widget.controller.questions.length - 1 ? 'Suivant' : 'Terminer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
