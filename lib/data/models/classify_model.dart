class ClassifyModel {
  final String classifyName;
  final int completedCount;
  final int totalQuestions;

  ClassifyModel({
    required this.classifyName,
    required this.completedCount,
    required this.totalQuestions,
  });

  factory ClassifyModel.fromMap(Map<String, dynamic> map, {int completed = 0}) {
    return ClassifyModel(
      // Thay đổi 'classify' thành tên cột chính xác trong file .db của bạn
      classifyName: map['classify'] ?? 'N/A',
      totalQuestions: map['total_questions'] ?? 0,
      completedCount: completed,
    );
  }
}
