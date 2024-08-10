import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks();

  Future<Either<Failure, bool>> deleteTask(List<TaskEntity> newList);
}
