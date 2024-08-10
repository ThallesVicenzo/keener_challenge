import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage.dart';
import 'package:keener_challenge/core/secure_storage/secure_storage_impl.dart';
import 'package:keener_challenge/features/add_task/add_task_module.dart';
import 'package:keener_challenge/features/edit_task/edit_task_module.dart';
import 'package:keener_challenge/features/home/home_module.dart';
import 'package:keener_challenge/features/login/login_module.dart';
import 'package:keener_challenge/features/sign_up/sign_up_module.dart';
import 'package:keener_challenge/features/welcome/welcome_module.dart';

import 'core/presenter/pages/default_erro_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.add<FirebaseAuth>(
      () => FirebaseAuth.instance,
      key: 'auth',
    );
    i.add<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
      key: 'firestore',
    );
    i.add<SecureStorage>(
      SecureStorageImpl.new,
      key: 'storage',
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      NamedRoutes.welcome.route,
      module: WelcomeModule(),
    );
    r.module(
      NamedRoutes.signUp.route,
      module: SignUpModule(),
    );
    r.module(
      NamedRoutes.login.route,
      module: LoginModule(),
    );
    r.module(
      NamedRoutes.home.route,
      module: HomeModule(),
    );
    r.module(
      NamedRoutes.addTask.route,
      module: AddTaskModule(),
    );
    r.module(
      NamedRoutes.editTask.route,
      module: EditTaskModule(),
    );

    r.child(
      NamedRoutes.defaultError.route,
      child: (context) {
        final erroParams = r.args.data is ErrorPageParams
            ? (r.args.data as ErrorPageParams)
            : const ErrorPageParams();
        return DefaultErrorPage(
          params: erroParams,
          onBackStart: () {
            Modular.to.navigate(NamedRoutes.home.route);
          },
        );
      },
    );
    super.routes(r);
  }
}
