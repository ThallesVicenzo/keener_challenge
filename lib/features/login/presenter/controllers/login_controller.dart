import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/login/domain/usecase/login_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  PageState<UserCredential> state = InitialState();

  LoginControllerBase({required this.usecase});

  final LoginUsecase usecase;

  @observable
  bool obscurePassword = true;

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ];

  @action
  void changePasswordVisibility() {
    obscurePassword = !obscurePassword;
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

  @action
  Future<void> login(context) async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate()) {
      state = LoadingState();

      final result = await usecase.login(
        email: controllers[0].text,
        password: controllers[1].text,
      );

      result.fold(
        (l) {
          state = ErrorState(error: l);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AppText(
                l.message ?? 'Invalid user, please try again.',
                style: MyTextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.deepPurple,
            ),
          );
        },
        (r) async {
          Modular.to.navigate(NamedRoutes.home.route);
          state = SuccessState(data: r);
        },
      );
    }
  }
}
