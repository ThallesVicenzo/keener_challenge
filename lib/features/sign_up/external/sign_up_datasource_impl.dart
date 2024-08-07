import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/features/sign_up/infra/datasource/sign_up_datasource.dart';

class SignUpDataSourceImpl implements SignUpDatasource {
  final FirebaseAuth firebaseAuth;

  SignUpDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> registerAccount(
      {required String email, required String password}) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}
