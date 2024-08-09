import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/home/domain/repository/home_repository.dart';
import 'package:keener_challenge/features/home/domain/usecases/home_usecase.dart';
import 'package:keener_challenge/features/home/external/home_datasource_impl.dart';
import 'package:keener_challenge/features/home/infra/datasource/home_datasource.dart';
import 'package:keener_challenge/features/home/infra/repository/home_repository_impl.dart';
import 'package:keener_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:keener_challenge/features/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<HomeDatasource>(
      HomeDatasourceImpl(
        firestore: Modular.get(key: 'firestore'),
        storage: Modular.get(key: 'storage'),
      ),
    );
    i.add<HomeRepository>(HomeRepositoryImpl.new);
    i.add<HomeUsecase>(HomeUsecaseImpl.new);
    i.addInstance<HomeController>(
      HomeController(
        usecase: i<HomeUsecase>(),
        firebaseAuth: Modular.get(key: 'auth'),
      ),
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(
        controller: context.read<HomeController>(),
      ),
    );
    super.routes(r);
  }
}
