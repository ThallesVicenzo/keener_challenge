import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/features/home/domain/repository/home_repository.dart';

abstract class HomeUsecase {
  Future<Either<Failure, Stream<List<TaskEntity>>>> getTasks();
  Future<Either<Failure, bool>> deleteTask(TaskEntity newList);
}

class HomeUsecaseImpl implements HomeUsecase {
  final HomeRepository repository;

  HomeUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, Stream<List<TaskEntity>>>> getTasks() async {
    return await repository.getTasks();
  }

  @override
  Future<Either<Failure, bool>> deleteTask(TaskEntity item) async {
    return await repository.deleteTask(item);
  }
}
