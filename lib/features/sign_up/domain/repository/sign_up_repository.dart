import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class SignUpRepository {
  Future<Either<Failure, UserCredential>> registerAccount({
    required String email,
    required String password,
  });
}
