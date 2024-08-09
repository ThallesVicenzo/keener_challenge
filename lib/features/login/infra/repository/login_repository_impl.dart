import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/core/errors/failures.dart';

import '../../domain/repository/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = await dataSource.login(email: email, password: password);
      return Right(request);
    } on FirebaseAuthException catch (e) {
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
