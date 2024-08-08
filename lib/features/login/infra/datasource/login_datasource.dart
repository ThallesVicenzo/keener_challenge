import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDatasource {
  Future<UserCredential> login({
    required String email,
    required String password,
  });
}
