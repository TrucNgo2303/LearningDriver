import 'package:flutter/material.dart';
import 'package:learing_driver_app/ui/screens/question_screen/question_provider.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/answer.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/bottom_nav_question.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/explanation.dart';
import 'package:learing_driver_app/ui/screens/question_screen/widget/question.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatefulWidget {
  final String classify;
  const QuestionScreen({super.key, required this.classify});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    // Load dữ liệu ngay khi vào màn hình bằng classify truyền vào
    Future.microtask(
      () => context.read<QuestionProvider>().fetchQuestion(widget.classify),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuestionProvider>();
    final question = provider.currentQuestion;

    return Scaffold(
      appBar: CustomAppBar(title: "Ôn tập ${widget.classify}"),
      bottomNavigationBar: BottomNavQuestion(
        currentQuestion: provider.currentIndex + 1,
        totalQuestions: provider.questions.length,
        onBackTap: provider.previousQuestion,
        onNextTap: provider.nextQuestion,
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : question == null
          ? const Center(child: Text("Không tìm thấy câu hỏi nào"))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget hiển thị nội dung câu hỏi và ảnh (nếu có)
                  QuestionWidget(
                    id: provider.currentIndex + 1, // Số thứ tự câu hiển thị
                    questionText: question.questionText,
                    isCritical: question.isCritical,
                    imageUrl: question.imageUrl,
                  ),
                  const SizedBox(height: 20),

                  // Danh sách các câu trả lời lấy từ list options trong model
                  ...List.generate(question.options.length, (index) {
                    final answerIndex = index + 1;
                    // 1. isSelected: Chỉ TRUE nếu index này đúng bằng index user vừa bấm
                    final isSelected =
                        provider.currentSelectedAnswer == answerIndex;

                    // 2. isCorrect: Kiểm tra xem đáp án hiện tại có đúng với DB không
                    final isCorrect = answerIndex == question.correctAnswer;

                    return AnswerWidget(
                      id: answerIndex,
                      text: question.options[index],
                      isSelected: isSelected, // Chỉ highlight câu đang chọn
                      isCorrect:
                          isCorrect, // Màu sắc (Xanh/Đỏ) sẽ dựa trên việc câu ĐANG CHỌN có đúng hay không
                      onTap: () =>
                          provider.selectAnswer(question.id, answerIndex),
                    );
                  }),

                  // 3. Logic hiển thị ExplanationWidget
                  if (provider.currentSelectedAnswer != null &&
                      provider.currentSelectedAnswer == question.correctAnswer)
                    ExplanationWidget(
                      isChooseCorrect: true,
                      explanation: question.explanation,
                    ),

                  const SizedBox(
                    height: 100,
                  ), // Khoảng trống để không bị đè bởi BottomNav
                ],
              ),
            ),
    );
  }
}
