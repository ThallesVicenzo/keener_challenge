import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/features/login/infra/datasource/login_datasource.dart';

class LoginDataSourceImpl implements LoginDatasource {
  final FirebaseAuth firebaseAuth;

  LoginDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}
