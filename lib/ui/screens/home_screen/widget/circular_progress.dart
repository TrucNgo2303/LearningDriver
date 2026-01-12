import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learing_driver_app/core/constants/app_colors.dart';

class CircularProgress extends StatelessWidget {
  final double value;
  final double maxValue = 600.0;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final bool showPercentage;

  const CircularProgress({
    super.key,
    required this.value,
    this.size = 200.0,
    this.progressColor = AppColors.secondary,
    this.backgroundColor = AppColors.success,
    this.showPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    String label = showPercentage
        ? '${((value / 600) * 100).toInt()}%'
        : '${value.toInt()}/600';

    return CustomPaint(
      size: Size(size, size),
      painter: ProgressPainter(
        value: value,
        maxValue: maxValue,
        progressColor: progressColor,
        backgroundColor: backgroundColor,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: size * 0.15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double value;
  final double maxValue;
  final Color progressColor;
  final Color backgroundColor;

  ProgressPainter({
    required this.value,
    required this.maxValue,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 12.0;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Vẽ thanh tiến độ (màu chính)
    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap
          .round // Làm bo tròn đầu thanh tiến độ
      ..strokeWidth = strokeWidth;

    // Tính toán góc quét dựa trên n/600
    double sweepAngle = (value / maxValue) * 2 * pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Bắt đầu từ đỉnh trên cùng (12 giờ)
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
