import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import các file theo cấu trúc của bạn
import 'package:learing_driver_app/ui/screens/practice_screen/practice_provider.dart';
import 'package:learing_driver_app/ui/screens/practice_screen/widget/classify_question.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_app_bar.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bọc Provider tại đây để nó chỉ tồn tại trong phạm vi màn hình này
    return ChangeNotifierProvider(
      create: (_) => PracticeProvider(),
      child: const _PracticeScreenContent(),
    );
  }
}

// Tách phần nội dung ra một widget riêng để tránh lỗi context khi gọi Provider
class _PracticeScreenContent extends StatefulWidget {
  const _PracticeScreenContent();

  @override
  State<_PracticeScreenContent> createState() => _PracticeScreenContentState();
}

class _PracticeScreenContentState extends State<_PracticeScreenContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PracticeProvider>().fetchClassifies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Ôn tập trắc nghiệm"),
      body: Consumer<PracticeProvider>(
        builder: (context, provider, child) {
          // Trạng thái đang tải
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Trạng thái không có dữ liệu
          if (provider.classifies.isEmpty) {
            return const Center(
              child: Text(
                "Không tìm thấy dữ liệu bộ đề.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          // Hiển thị danh sách card
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            itemCount: provider.classifies.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final item = provider.classifies[index];

              return ClassifyQuestionCard(
                classifyName: item.classifyName,
                completedCount: item.completedCount, // Mặc định là 0
                totalCount: item.totalQuestions,
                onTap: () {
                  // Chuyển đến màn hình danh sách câu hỏi theo phân loại
                  debugPrint("Mở phân loại: ${item.classifyName}");
                },
              );
            },
          );
        },
      ),
    );
  }
}
