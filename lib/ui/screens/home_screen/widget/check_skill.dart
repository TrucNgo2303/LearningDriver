import 'package:flutter/material.dart';

enum ExamStatus { ready, needImprovement, notReady }

class CheckSkill extends StatelessWidget {
  final ExamStatus status;
  final VoidCallback onTap;

  const CheckSkill({super.key, required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String text;
    Color color;

    switch (status) {
      case ExamStatus.ready:
        icon = Icons.thumb_up;
        text = "Sẵn sàng đi thi";
        color = Colors.green;
        break;
      case ExamStatus.needImprovement:
        icon = Icons.trending_up;
        text = "Có thể thi, cần cải thiện thêm";
        color = Colors.orange;
        break;
      case ExamStatus.notReady:
        icon = Icons.warning;
        text = "Chưa đủ khả năng thi";
        color = Colors.red;
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior:
          Clip.antiAlias, // Để hiệu ứng nhấn (InkWell) bo theo góc card
      child: InkWell(
        onTap: onTap, // Xử lý sự kiện nhấn
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
