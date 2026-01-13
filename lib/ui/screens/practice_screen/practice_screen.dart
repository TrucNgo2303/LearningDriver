import 'package:flutter/material.dart';
import 'package:learing_driver_app/ui/screens/practice_screen/widget/classify_question.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_app_bar.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> apiData = [
      {"name": "Câu điểm liệt", "done": 40, "total": 60},
      {"name": "Khái niệm quy tắc", "done": 50, "total": 100},
      {"name": "Nghiệp vụ vận tải", "done": 10, "total": 30},
      {"name": "Kỹ thuật lái xe", "done": 20, "total": 20},
    ];

    return Scaffold(
      appBar: CustomAppBar(title: "Ôn tập trắc nghiệm"),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: apiData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = apiData[index];
          return ClassifyQuestionCard(
            classifyName: item['name'],
            completedCount: item['done'],
            totalCount: item['total'],
            onTap: () {},
          );
        },
      ),
    );
  }
}
