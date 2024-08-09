// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on SignUpControllerBase, Store {
  late final _$obscurePasswordAtom =
      Atom(name: 'SignUpControllerBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$obscureConfirmPasswordAtom = Atom(
      name: 'SignUpControllerBase.obscureConfirmPassword', context: context);

  @override
  bool get obscureConfirmPassword {
    _$obscureConfirmPasswordAtom.reportRead();
    return super.obscureConfirmPassword;
  }

  @override
  set obscureConfirmPassword(bool value) {
    _$obscureConfirmPasswordAtom
        .reportWrite(value, super.obscureConfirmPassword, () {
      super.obscureConfirmPassword = value;
    });
  }

  late final _$createAccountAsyncAction =
      AsyncAction('SignUpControllerBase.createAccount', context: context);

  @override
  Future<void> createAccount(dynamic context) {
    return _$createAccountAsyncAction.run(() => super.createAccount(context));
  }

  late final _$SignUpControllerBaseActionController =
      ActionController(name: 'SignUpControllerBase', context: context);

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPasswordVisibility() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.changeConfirmPasswordVisibility');
    try {
      return super.changeConfirmPasswordVisibility();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscurePassword: ${obscurePassword},
obscureConfirmPassword: ${obscureConfirmPassword}
    ''';
  }
}
