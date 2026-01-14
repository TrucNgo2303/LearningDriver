import 'package:flutter/material.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/bottom_nav_question.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_app_bar.dart';

class QuestionScreen extends StatefulWidget {
  final int questionId;
  const QuestionScreen({super.key, this.questionId = 1});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Câu hỏi lý thuyết"),
      bottomNavigationBar: BottomNavQuestion(
        currentQuestion: 1,
        totalQuestions: 100,
        onBackTap: () {},
        onNextTap: () {},
      ),
      body: Center(child: Text("Hôm nay tôi buồn")),
    );
  }
}
