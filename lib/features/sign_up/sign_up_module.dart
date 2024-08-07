import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/sign_up/domain/repository/sign_up_repository.dart';
import 'package:keener_challenge/features/sign_up/domain/usecase/sign_up_usecase.dart';
import 'package:keener_challenge/features/sign_up/external/sign_up_datasource_impl.dart';
import 'package:keener_challenge/features/sign_up/infra/datasource/sign_up_datasource.dart';
import 'package:keener_challenge/features/sign_up/infra/repository/sign_in_repository_impl.dart';
import 'package:keener_challenge/features/sign_up/presenter/controllers/sign_up_controller.dart';
import 'package:keener_challenge/features/sign_up/presenter/pages/sign_up_page.dart';

class SignUpModule extends Module {
  @override
  void binds(Injector i) {
    i.add<SignUpDatasource>(SignUpDataSourceImpl.new);
    i.add<SignUpRepository>(SignUpRepositoryImpl.new);
    i.add<SignUpUsecase>(SignUpUsecaseImpl.new);
    i.add<SignUpController>(SignUpController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SignUpPage(),
      transition: TransitionType.rightToLeft,
    );
    super.routes(r);
  }
}
