import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/welcome/presenter/pages/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const WelcomePage(),
    );
    super.routes(r);
  }
}
