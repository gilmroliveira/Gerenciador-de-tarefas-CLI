class Task {
  static int _idCounter = 1;
  final int id;
  String title;
  String description;
  bool isCompleted;

  Task({
    required this.title,
    this.description = '',
    this.isCompleted = false,
  }) : id = _idCounter++;

  @override
  String toString() {
    String status = isCompleted ? '[X]' : '[ ]';
    return '$id. $status $title ${description.isNotEmpty ? "($description)" : ""}';
  }
}
