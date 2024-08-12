import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/core/errors/failures.dart';
import 'package:keener_challenge/features/home/domain/repository/home_repository.dart';
import 'package:keener_challenge/features/home/infra/datasource/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, Stream<List<TaskEntity>>>> getTasks() async {
    try {
      final request = await datasource.getTasks();
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

  @override
  Future<Either<Failure, bool>> deleteTask(TaskEntity item) async {
    try {
      final request = await datasource.deleteTask(item);
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
