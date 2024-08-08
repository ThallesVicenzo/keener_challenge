import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/login/domain/repository/login_repository.dart';
import 'package:keener_challenge/features/login/domain/usecase/login_usecase.dart';
import 'package:keener_challenge/features/login/external/login_datasource_impl.dart';
import 'package:keener_challenge/features/login/infra/datasource/login_datasource.dart';
import 'package:keener_challenge/features/login/infra/repository/login_repository_impl.dart';
import 'package:keener_challenge/features/login/presenter/controllers/login_controller.dart';
import 'package:keener_challenge/features/login/presenter/pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<LoginDatasource>(
      LoginDataSourceImpl(
        Modular.get(key: 'auth'),
      ),
    );
    i.add<LoginRepository>(LoginRepositoryImpl.new);
    i.add<LoginUsecase>(LogincaseImpl.new);
    i.add<LoginController>(LoginController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => LoginPage(
        controller: context.read<LoginController>(),
      ),
      transition: TransitionType.rightToLeft,
    );
    super.routes(r);
  }
}
