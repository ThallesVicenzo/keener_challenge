import 'package:dartz/dartz.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/features/home/domain/repository/home_repository.dart';

abstract class HomeUsecase {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
}

class HomeUsecaseImpl implements HomeUsecase {
  final HomeRepository repository;

  HomeUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    return await repository.getTasks();
  }
}