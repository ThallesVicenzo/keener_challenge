import 'package:flutter/material.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/infra/models/task_model.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/widgets/dialog/task_dialog.dart';
import 'package:keener_challenge/features/edit_task/domain/usecases/edit_task_usecase.dart';
import 'package:mobx/mobx.dart';

part 'edit_task_controller.g.dart';

class EditTaskController = EditTaskControllerBase with _$EditTaskController;

abstract class EditTaskControllerBase with Store {
  EditTaskControllerBase({required this.usecase});

  final EditTaskUsecase usecase;

  @observable
  PageState<bool> state = InitialState();

  @observable
  bool? isCompleted;

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ];

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  void setUpValues(String title, String description, bool initialIsCompleted) {
    controllers[0].text = title;
    controllers[1].text = description;
    isCompleted = initialIsCompleted;
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty!';
    }

    return null;
  }

  @action
  void switchToggle(bool value) {
    isCompleted = value;
  }

  @action
  Future<void> editTask(
    List<TaskEntity> list,
    int index,
    context,
  ) async {
    state = LoadingState();

    list[index] = TaskModel(
      isCompleted: isCompleted ?? false,
      title: controllers[0].text,
      description: controllers[1].text,
    );

    final result = await usecase.editTask(list);

    result.fold(
      (l) => state = ErrorState(error: l),
      (r) {
        state = InitialState();
        showDialog(
          context: context,
          builder: (context) => const TaskDialog(title: 'Task Edited!'),
        );
      },
    );
  }
}
