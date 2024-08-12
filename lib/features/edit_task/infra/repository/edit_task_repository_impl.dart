import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/core/errors/failures.dart';
import 'package:keener_challenge/features/edit_task/domain/repository/edit_task_repository.dart';
import 'package:keener_challenge/features/edit_task/infra/datasource/edit_task_datasource.dart';

class EditTaskRepositoryImpl implements EditTaskRepository {
  final EditTaskDatasource datasource;

  EditTaskRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, bool>> editTask(List<TaskEntity> entity) async {
    try {
      final request = await datasource.editTask(entity);
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
