import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/login/presenter/pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const LoginPage(),
      transition: TransitionType.rightToLeft,
    );
    super.routes(r);
  }
}
