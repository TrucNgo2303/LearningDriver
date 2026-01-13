import 'package:flutter/material.dart';

class ClassifyQuestionCard extends StatelessWidget {
  final String classifyName;
  final int completedCount;
  final int totalCount;
  final VoidCallback? onTap;

  const ClassifyQuestionCard({
    super.key,
    required this.classifyName,
    required this.completedCount,
    required this.totalCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Tính toán tỷ lệ phần trăm cho thanh tiến độ (từ 0.0 đến 1.0)
    double progressValue = totalCount > 0 ? completedCount / totalCount : 0.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity, // Rộng toàn màn hình
        height: 140, // Chiều cao cố định
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Bo góc
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Classify Name
            Text(
              classifyName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // 2. Thanh tiến độ (Progress Bar)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progressValue,
                minHeight: 12,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            ),

            // 3. Text hiển thị số câu
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Đã học $completedCount/$totalCount",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
