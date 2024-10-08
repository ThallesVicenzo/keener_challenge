import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, Stream<List<TaskEntity>>>> getTasks();

  Future<Either<Failure, bool>> deleteTask(TaskEntity item);
}
