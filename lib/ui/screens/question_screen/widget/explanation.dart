import 'package:flutter/material.dart';

class ExplanationWidget extends StatelessWidget {
  final bool isChooseCorrect;
  final String explanation;

  const ExplanationWidget({
    super.key,
    required this.isChooseCorrect,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    if (!isChooseCorrect) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Giải thích:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(explanation),
        ],
      ),
    );
  }
}
