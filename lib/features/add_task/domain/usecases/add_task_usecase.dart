import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/features/add_task/domain/repository/add_task_repository.dart';

abstract class AddTaskUsecase {
  Future<Either<Failure, bool>> addTask(TaskEntity entity);
}

class AddTaskUsecaseImpl implements AddTaskUsecase {
  final AddTaskRepository repository;

  AddTaskUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> addTask(TaskEntity entity) async {
    return await repository.addTask(entity);
  }
}
