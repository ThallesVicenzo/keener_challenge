import 'package:keener_challenge/core/domain/entities/task_entity.dart';

abstract class AddTaskDatasource {
  Future<bool> addTask(TaskEntity item);
}
