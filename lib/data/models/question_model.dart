class QuestionModel {
  final int id;
  final String questionText;
  final String? imageUrl;
  final int isCritical;
  final int correctAnswer;
  final String explanation;
  final List<String> options;

  QuestionModel({
    required this.id,
    required this.questionText,
    this.imageUrl,
    required this.isCritical,
    required this.correctAnswer,
    required this.explanation,
    required this.options,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'],
      questionText: map['question_text'],
      imageUrl: map['image_url'],
      isCritical: map['is_critical'],
      correctAnswer: map['correct_answer'],
      explanation: map['explanation'] ?? "",
      options: [
        map['option_1'],
        map['option_2'],
        if (map['option_3'] != null) map['option_3'],
        if (map['option_4'] != null) map['option_4'],
      ],
    );
  }
}
