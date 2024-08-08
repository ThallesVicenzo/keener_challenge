import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });
}
