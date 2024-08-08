import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/features/sign_up/domain/usecase/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  SignUpControllerBase({required this.usecase, required this.secureStorage});

  final SignUpUsecase usecase;
  final SecureStorage secureStorage;

  final state = ValueNotifier<PageState<UserCredential>>(InitialState());

  @observable
  bool obscurePassword = true;

  @observable
  bool obscureConfirmPassword = true;

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @action
  void changePasswordVisibility() {
    obscurePassword = !obscurePassword;
  }

  @action
  void changeConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty!';
    } else if (value.length > 10) {
      return 'Username can\'t have more than 10 characters.';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty!';
    } else if (EmailValidator.validate(value) == false) {
      return 'Please type a valid email.';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty!';
    } else if (value.length < 6) {
      return 'Password can not have less than six characters.';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (controllers[2].text != controllers[3].text) {
      return 'Passwords must be equal!';
    }
    return null;
  }

  @action
  Future<void> createAccount() async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate() &&
        formKeys[2].currentState!.validate() &&
        formKeys[3].currentState!.validate()) {
      state.value = LoadingState();

      final result = await usecase.createAccount(
        email: controllers[1].text,
        password: controllers[2].text,
      );

      result.fold(
        (l) => state.value = ErrorState(error: l),
        (r) async {
          await secureStorage.write(
            key: SecureStorageKeys.username.key,
            value: controllers[0].text,
          );
          Modular.to.navigate(NamedRoutes.home.route);
          state.value = SuccessState(data: r);
        },
      );
    }
  }
}
