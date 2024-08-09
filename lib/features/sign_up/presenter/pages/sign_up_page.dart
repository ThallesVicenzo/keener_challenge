import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/app_bar/default_app_bar.dart';
import 'package:keener_challenge/core/presenter/widgets/buttons/app_primary_button.dart';
import 'package:keener_challenge/core/presenter/widgets/custom_padding/custom_padding_page.dart';
import 'package:keener_challenge/core/presenter/widgets/text%20fields/app_text_form_field.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/sign_up/presenter/controllers/sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.controller});

  final SignUpController controller;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Sign Up',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 340,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          AppText(
                            'Add your information to create a user account!',
                            fontSize: FontSize.medium,
                            style: MyTextStyle(
                              textAlign: TextAlign.center,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                                builder: (_) => AppTextFormField(
                                  hintText: 'Type your password here...',
                                  controller: widget.controller.controllers[1],
                                  obscureText:
                                      widget.controller.obscurePassword,
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
                          Form(
                            key: widget.controller.formKeys[2],
                            child: Observer(
                              builder: (_) => AppTextFormField(
                                hintText: 'Confirm password...',
                                validator: (value) => widget.controller
                                    .validateConfirmPassword(value),
                                controller: widget.controller.controllers[2],
                                obscureText:
                                    widget.controller.obscureConfirmPassword,
                                keyboardType: TextInputType.emailAddress,
                                sufix: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.controller
                                          .changeConfirmPasswordVisibility();
                                    },
                                    child: Icon(
                                      widget.controller.obscureConfirmPassword
                                          ? Icons.visibility_off
                                          : Icons.remove_red_eye,
                                      color: Colors.white,
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
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppPrimaryButton(
                        title: 'Create user account',
                        onTap: () {
                          widget.controller.createAccount(context);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to
                            .pushReplacementNamed(NamedRoutes.login.route);
                      },
                      child:
                          const AppText('Already have an account? Click here'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
