import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/features/edit_task/domain/repository/edit_task_repository.dart';
import 'package:keener_challenge/features/edit_task/domain/usecases/edit_task_usecase.dart';
import 'package:keener_challenge/features/edit_task/external/edit_task_datasource_impl.dart';
import 'package:keener_challenge/features/edit_task/infra/datasource/edit_task_datasource.dart';
import 'package:keener_challenge/features/edit_task/infra/repository/edit_task_repository_impl.dart';
import 'package:keener_challenge/features/edit_task/presenter/controllers/edit_task_controller.dart';
import 'package:keener_challenge/features/edit_task/presenter/pages/edit_task_page.dart';

class EditTaskModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<EditTaskDatasource>(
      EditTaskDatasourceImpl(
        firestore: Modular.get(key: 'firestore'),
        storage: Modular.get(key: 'storage'),
      ),
    );
    i.add<EditTaskRepository>(EditTaskRepositoryImpl.new);
    i.add<EditTaskUsecase>(EditTaskUsecaseImpl.new);
    i.add<EditTaskController>(EditTaskController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.rightToLeft,
      child: (context) => EditTaskPage(
        entityList: r.args.data['entityList'] as List<TaskEntity>,
        index: r.args.data['index'] as int,
        controller: context.read<EditTaskController>(),
      ),
    );
    super.routes(r);
  }
}
