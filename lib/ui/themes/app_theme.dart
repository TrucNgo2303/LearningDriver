import 'package:flutter/material.dart';
import 'package:learing_driver_app/core/constants/app_colors.dart';

class AppTheme {
  static const Color appColorPrimary = AppColors.primary; 

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      fontFamily: 'BeVietnamPro',

      colorScheme: ColorScheme.fromSeed(
        seedColor: appColorPrimary,
        primary: appColorPrimary,
      ),
      // Bạn có thể định nghĩa thêm font chữ, button theme ở đây
      appBarTheme: const AppBarTheme(
        backgroundColor: appColorPrimary,
        foregroundColor: Colors.white,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}