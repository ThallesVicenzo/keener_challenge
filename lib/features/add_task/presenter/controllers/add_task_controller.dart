import 'package:flutter/material.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/dialog/task_dialog.dart';
import 'package:keener_challenge/features/add_task/domain/usecases/add_task_usecase.dart';
import 'package:mobx/mobx.dart';

part 'add_task_controller.g.dart';

class AddTaskController = AddTaskControllerBase with _$AddTaskController;

abstract class AddTaskControllerBase with Store {
  AddTaskControllerBase({required this.usecase});

  final AddTaskUsecase usecase;

  @observable
  PageState<bool> state = InitialState();

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ];

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  void clearControllers() {
    for (TextEditingController controller in controllers) {
      controller.clear();
    }
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty!';
    }

    return null;
  }

  @action
  Future<void> addTask(context) async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate()) {
      state = LoadingState();

      final result = await usecase.addTask(
        TaskEntity(
          isCompleted: false,
          title: controllers[0].text,
          description: controllers[1].text,
        ),
      );

      result.fold(
        (l) => state = ErrorState(error: l),
        (r) {
          state = InitialState();
          clearControllers();
          showDialog(
            context: context,
            builder: (context) => const TaskDialog(
              title: 'Task created!',
            ),
          );
        },
      );
    }
  }
}
