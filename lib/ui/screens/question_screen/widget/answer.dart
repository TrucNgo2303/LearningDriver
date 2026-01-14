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
    // Xác định màu sắc dựa trên trạng thái chọn
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    Color textColor = Colors.black87;

    if (isSelected) {
      borderColor = isCorrect ? Colors.green : Colors.red;
      bgColor = isCorrect ? Colors.green : Colors.red;
      textColor =
          Colors.white; // Đổi màu chữ trắng khi nền đã có màu đậm (Xanh/Đỏ)
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double
            .infinity, // Đảm bảo container chiếm hết chiều ngang để căn lề trái chuẩn
        alignment: Alignment.centerLeft, // Căn lề trái cho nội dung bên trong
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Text(
          "$id. $text", // Hiển thị theo định dạng: 1. Text
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
