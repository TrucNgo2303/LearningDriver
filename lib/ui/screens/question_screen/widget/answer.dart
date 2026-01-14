import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final int id;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const AnswerWidget({
    super.key,
    required this.id,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;

    if (isSelected) {
      borderColor = isCorrect ? Colors.green : Colors.red;
      bgColor = isCorrect ? Colors.green : Colors.red;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
