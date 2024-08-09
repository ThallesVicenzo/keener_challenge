import 'package:keener_challenge/core/domain/entities/task_entity.dart';

class HomeModel extends TaskEntity {
  HomeModel({
    required super.isCompleted,
    required super.title,
    required super.description,
  });

  factory HomeModel.fromJson(Map<String, dynamic>? json) => HomeModel(
        isCompleted: json?['isCompleted'] ?? false,
        title: json?['title'] ?? 'Undefined',
        description: json?['description'] ?? 'Undefined',
      );
}
