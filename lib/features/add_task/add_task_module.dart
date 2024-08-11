import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/features/add_task/domain/repository/add_task_repository.dart';
import 'package:keener_challenge/features/add_task/domain/usecases/add_task_usecase.dart';
import 'package:keener_challenge/features/add_task/external/add_task_datasource_impl.dart';
import 'package:keener_challenge/features/add_task/infra/datasource/add_task_datasource.dart';
import 'package:keener_challenge/features/add_task/presenter/controllers/add_task_controller.dart';
import 'package:keener_challenge/features/add_task/presenter/pages/add_task_page.dart';

import 'infra/repository/add_task_repository_impl.dart';

class AddTaskModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<AddTaskDatasource>(
      AddTaskDatasourceImpl(
        firestore: Modular.get(key: 'firestore'),
        storage: Modular.get(key: 'storage'),
      ),
    );
    i.add<AddTaskRepository>(AddTaskRepositoryImpl.new);
    i.add<AddTaskUsecase>(AddTaskUsecaseImpl.new);
    i.add<AddTaskController>(AddTaskController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.rightToLeft,
      child: (context) => AddTaskPage(
        controller: context.read<AddTaskController>(),
      ),
    );
    super.routes(r);
  }
}
