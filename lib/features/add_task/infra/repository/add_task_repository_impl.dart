import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/core/errors/failures.dart';
import 'package:keener_challenge/features/add_task/domain/repository/add_task_repository.dart';
import 'package:keener_challenge/features/add_task/infra/datasource/add_task_datasource.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final AddTaskDatasource datasource;

  AddTaskRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, bool>> addTask(TaskEntity entity) async {
    try {
      final request = await datasource.addTask(entity);
      return Right(request);
    } on FirebaseException catch (e) {
      return Left(
        NetworkFailure(
          e.message,
        ),
      );
    } catch (e) {
      return Left(
        GenericFailure(e.toString()),
      );
    }
  }
}
