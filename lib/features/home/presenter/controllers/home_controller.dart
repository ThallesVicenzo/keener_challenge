import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/home/domain/usecases/home_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase({
    required this.usecase,
    required this.firebaseAuth,
  });

  final HomeUsecase usecase;
  final FirebaseAuth firebaseAuth;

  @observable
  PageState<Stream<List<TaskEntity>>> state = InitialState();

  @observable
  PageState<bool> deleteTaskState = InitialState();

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Modular.to.navigate(NamedRoutes.welcome.route);
  }

  @action
  Future<void> getTasks() async {
    state = LoadingState();

    final result = await usecase.getTasks();

    result.fold(
      (l) => state = ErrorState(error: l),
      (r) => state = SuccessState(data: r),
    );
  }

  Future<void> deleteTask(TaskEntity item) async {
    deleteTaskState = LoadingState();

    final result = await usecase.deleteTask(item);

    result.fold(
      (l) => deleteTaskState = ErrorState(error: l),
      (r) => deleteTaskState = SuccessState(data: r),
    );
  }
}
