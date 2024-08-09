import 'package:firebase_auth/firebase_auth.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/sign_up/infra/datasource/sign_up_datasource.dart';

class SignUpDataSourceImpl implements SignUpDatasource {
  final FirebaseAuth firebaseAuth;
  final SecureStorage secureStorage;

  SignUpDataSourceImpl(this.firebaseAuth, this.secureStorage);

  @override
  Future<UserCredential> registerAccount(
      {required String email, required String password}) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await secureStorage.write(
      key: SecureStorageKeys.userId.key,
      value: firebaseAuth.currentUser!.uid,
    );

    return result;
  }
}
