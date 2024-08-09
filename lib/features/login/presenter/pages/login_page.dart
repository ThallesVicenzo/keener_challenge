import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/app_bar/default_app_bar.dart';
import 'package:keener_challenge/core/presenter/widgets/buttons/app_primary_button.dart';
import 'package:keener_challenge/core/presenter/widgets/custom_padding/custom_padding_page.dart';
import 'package:keener_challenge/core/presenter/widgets/text%20fields/app_text_form_field.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/features/login/presenter/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.controller});

  final LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Login',
        hasLeading: true,
      ),
      body: ValueListenableBuilder<PageState<UserCredential>>(
        valueListenable: widget.controller.state,
        builder: (context, state, child) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomPaddingPage(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        AppText(
                          'Login in your user account!',
                          fontSize: FontSize.medium,
                          style: MyTextStyle(
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: widget.controller.formKeys[0],
                          child: AppTextFormField(
                            hintText: 'Type your email here...',
                            validator: (value) =>
                                widget.controller.validateEmail(value),
                            controller: widget.controller.controllers[0],
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Form(
                            key: widget.controller.formKeys[1],
                            child: Observer(
                              builder: (context) => AppTextFormField(
                                hintText: 'Type your password here...',
                                controller: widget.controller.controllers[1],
                                obscureText: widget.controller.obscurePassword,
                                validator: (value) =>
                                    widget.controller.validatePassword(value),
                                sufix: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.controller
                                          .changePasswordVisibility();
                                    },
                                    child: Icon(
                                      widget.controller.obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.remove_red_eye,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: AppPrimaryButton(
                      title: 'Login',
                      onTap: () {
                        widget.controller.login(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
