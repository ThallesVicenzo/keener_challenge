import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/login/infra/datasource/login_datasource.dart';

class LoginDataSourceImpl implements LoginDatasource {
  final FirebaseAuth firebaseAuth;
  final SecureStorage storage;

  LoginDataSourceImpl(this.firebaseAuth, this.storage);

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await storage.write(
      key: SecureStorageKeys.userId.key,
      value: firebaseAuth.currentUser!.uid,
    );

    return result;
  }
}
