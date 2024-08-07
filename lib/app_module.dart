import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/sign_up/sign_up_module.dart';
import 'package:keener_challenge/features/welcome/welcome_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
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
    super.routes(r);
  }
}
