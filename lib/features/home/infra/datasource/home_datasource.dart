import 'package:keener_challenge/core/domain/entities/task_entity.dart';

abstract class HomeDatasource {
  Future<List<TaskEntity>> getTasks();
}
