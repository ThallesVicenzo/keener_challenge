import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/sign_up/presenter/sign_up_page.dart';

class SignUpModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SignUpPage(),
    );
    super.routes(r);
  }
}
