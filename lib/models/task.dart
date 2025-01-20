class Task {
  final String title;
  final String description;
  final DateTime deadline;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
      isCompleted: json['isCompleted'],
    );
  }
}
