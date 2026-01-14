import 'package:flutter/material.dart';
import 'package:learing_driver_app/data/datasources/local/database_helper.dart';
import 'package:learing_driver_app/data/models/classify_model.dart';

class PracticeProvider extends ChangeNotifier {
  List<ClassifyModel> _classifies = [];
  bool _isLoading = false;

  List<ClassifyModel> get classifies => _classifies;
  bool get isLoading => _isLoading;

  Future<void> fetchClassifies() async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await DatabaseHelper().database;

      // Lấy danh sách phân loại và đếm tổng số câu từ SQLite
      final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT 
            classify, 
            total_questions
        FROM (
            SELECT 
                'Câu điểm liệt' as classify, 
                COUNT(*) as total_questions,
                0 as sort_order, 
                0 as min_id 
            FROM questions 
            WHERE is_critical = 1

            UNION ALL

            SELECT 
                classify, 
                COUNT(*) as total_questions,
                1 as sort_order,
                MIN(id) as min_id
            FROM questions 
            GROUP BY classify
        ) AS result
        ORDER BY sort_order ASC, min_id ASC;
      ''');

      // Khởi tạo danh sách với completedCount mặc định là 0
      _classifies = maps.map((item) {
        return ClassifyModel.fromMap(item, completed: 0);
      }).toList();
    } catch (e) {
      debugPrint("Lỗi khi truy vấn SQLite: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
