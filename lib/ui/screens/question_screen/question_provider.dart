import 'package:flutter/material.dart';
import 'package:learing_driver_app/data/datasources/local/database_helper.dart';
import 'package:learing_driver_app/data/models/question_model.dart';

class QuestionProvider extends ChangeNotifier {
  List<QuestionModel> _questions = [];
  int _currentIndex = 0;
  bool _isLoading = false;

  // Lưu trữ index của đáp án người dùng chọn cho mỗi câu hỏi
  // Key: câu hỏi ID, Value: index đáp án
  Map<int, int?> _selectedAnswers = {};

  // Getters
  List<QuestionModel> get questions => _questions;
  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;
  QuestionModel? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentIndex] : null;

  // Lấy đáp án đã chọn của câu hỏi hiện tại
  int? get currentSelectedAnswer => _selectedAnswers[currentQuestion?.id];

  Future<void> fetchQuestion(String classify) async {
    _isLoading = true;
    _currentIndex = 0;
    _selectedAnswers = {}; // Reset đáp án khi load bộ mới
    notifyListeners();

    try {
      final db = await DatabaseHelper().database;
      String query;
      List<dynamic>? whereArgs;

      if (classify == 'Câu điểm liệt') {
        // Nếu là câu điểm liệt, lọc theo cột is_critical
        query = 'SELECT * FROM questions WHERE is_critical = 1';
        whereArgs = null;
      } else {
        // Các trường hợp khác, lọc theo cột classify thông thường
        query = 'SELECT * FROM questions WHERE classify = ?';
        whereArgs = [classify];
      }
      final List<Map<String, dynamic>> maps = await db.rawQuery(
        query,
        whereArgs,
      );
      _questions = maps.map((item) => QuestionModel.fromMap(item)).toList();
    } catch (e) {
      debugPrint("Lỗi: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectAnswer(int questionId, int answerIndex) {
    // Thay vì return nếu đã tồn tại, chúng ta cập nhật giá trị mới
    _selectedAnswers[questionId] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }
}
