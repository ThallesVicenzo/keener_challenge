import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/features/edit_task/domain/repository/edit_task_repository.dart';

abstract class EditTaskUsecase {
  Future<Either<Failure, bool>> editTask(List<TaskEntity> entity);
}

class EditTaskUsecaseImpl implements EditTaskUsecase {
  final EditTaskRepository repository;

  EditTaskUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> editTask(List<TaskEntity> entity) async {
    return await repository.editTask(entity);
  }
}
