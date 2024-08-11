import 'package:keener_challenge/core/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.isCompleted,
    required super.title,
    required super.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic>? json) => TaskModel(
        isCompleted: json?['isCompleted'] ?? false,
        title: json?['title'] ?? 'Undefined',
        description: json?['description'] ?? 'Undefined',
      );

  Map<String, dynamic> toJson() {
    return {
      'isCompleted': isCompleted,
      'title': title,
      'description': description,
    };
  }
}
