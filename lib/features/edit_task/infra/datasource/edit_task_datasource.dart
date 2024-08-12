import 'package:keener_challenge/core/domain/entities/task_entity.dart';

abstract class EditTaskDatasource {
  Future<bool> editTask(List<TaskEntity> entityList);
}
