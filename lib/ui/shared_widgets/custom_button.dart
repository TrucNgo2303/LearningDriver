import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final String text;
  final TextStyle? textStyle;


  const CustomButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.height,
    required this.width,
    required this.text,
    this.borderRadius = 8.0,
    this.textStyle
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius)
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: textStyle ?? const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            ),
          )
        ),
    );
  }
}
