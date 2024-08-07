import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';
import 'package:keener_challenge/features/sign_up/domain/repository/sign_up_repository.dart';

abstract class SignUpUsecase {
  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
  });
}

class SignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository repository;

  SignUpUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
  }) async {
    return await repository.registerAccount(
      email: email,
      password: password,
    );
  }
}
