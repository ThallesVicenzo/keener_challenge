import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class EditTaskRepository {
  Future<Either<Failure, bool>> editTask(List<TaskEntity> entity);
}
