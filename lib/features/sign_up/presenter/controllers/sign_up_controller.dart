import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/sign_up/domain/usecase/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  SignUpControllerBase({required this.usecase});

  final SignUpUsecase usecase;

  final state = ValueNotifier<PageState<UserCredential>>(InitialState());

  @observable
  bool obscurePassword = true;

  @observable
  bool obscureConfirmPassword = true;

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final controllers = <TextEditingController>[
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
    if (controllers[1].text != controllers[2].text) {
      return 'Passwords must be equal!';
    }
    return null;
  }

  @action
  Future<void> createAccount(context) async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate() &&
        formKeys[2].currentState!.validate()) {
      state.value = LoadingState();

      final result = await usecase.createAccount(
        email: controllers[0].text,
        password: controllers[1].text,
      );

      result.fold(
        (l) {
          state.value = ErrorState(error: l);
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
          state.value = SuccessState(data: r);
        },
      );
    }
  }
}
