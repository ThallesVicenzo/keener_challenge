// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditTaskController on EditTaskControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'EditTaskControllerBase.state', context: context);

  @override
  PageState<bool> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PageState<bool> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: 'EditTaskControllerBase.isCompleted', context: context);

  @override
  bool? get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool? value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$editTaskAsyncAction =
      AsyncAction('EditTaskControllerBase.editTask', context: context);

  @override
  Future<void> editTask(List<TaskEntity> list, int index, dynamic context) {
    return _$editTaskAsyncAction
        .run(() => super.editTask(list, index, context));
  }

  late final _$EditTaskControllerBaseActionController =
      ActionController(name: 'EditTaskControllerBase', context: context);

  @override
  void switchToggle(bool value) {
    final _$actionInfo = _$EditTaskControllerBaseActionController.startAction(
        name: 'EditTaskControllerBase.switchToggle');
    try {
      return super.switchToggle(value);
    } finally {
      _$EditTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isCompleted: ${isCompleted}
    ''';
  }
}
