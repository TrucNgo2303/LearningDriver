import 'package:flutter/material.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/question_grid.dart';

class BottomNavQuestion extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final VoidCallback onBackTap;
  final VoidCallback onNextTap;

  const BottomNavQuestion({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.onBackTap,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onBackTap,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            InkWell(
              onTap: () {
                showQuestionGrid(
                  context,
                  totalQuestions: 180,
                  correctQuestions: [1, 12, 35],
                  wrongQuestions: [2, 100],
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$currentQuestion/$totalQuestions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: onNextTap,
            ),
          ],
        ),
      ),
    );
  }
}
