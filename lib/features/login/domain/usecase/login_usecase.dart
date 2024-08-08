import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';

import '../repository/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });
}

class LogincaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LogincaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    return await repository.login(
      email: email,
      password: password,
    );
  }
}
