import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpDatasource {
  Future<UserCredential> registerAccount({
    required String email,
    required String password,
  });
}
