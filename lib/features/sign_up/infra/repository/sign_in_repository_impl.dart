import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/core/errors/failures.dart';
import 'package:keener_challenge/features/sign_up/domain/repository/sign_up_repository.dart';
import 'package:keener_challenge/features/sign_up/infra/datasource/sign_up_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource dataSource;

  SignUpRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserCredential>> registerAccount({
    required String email,
    required String password,
  }) async {
    try {
      final request =
          await dataSource.registerAccount(email: email, password: password);
      return Right(request);
    } catch (e) {
      return Left(
        GenericFailure(e.toString()),
      );
    }
  }
}
