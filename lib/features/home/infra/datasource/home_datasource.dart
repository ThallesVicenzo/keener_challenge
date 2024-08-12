import 'package:keener_challenge/core/domain/entities/task_entity.dart';

abstract class HomeDatasource {
  Future<Stream<List<TaskEntity>>> getTasks();

  Future<bool> deleteTask(TaskEntity item);
}
