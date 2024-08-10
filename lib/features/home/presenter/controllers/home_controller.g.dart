// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'HomeControllerBase.state', context: context);

  @override
  PageState<List<TaskEntity>> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PageState<List<TaskEntity>> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$deleteTaskStateAtom =
      Atom(name: 'HomeControllerBase.deleteTaskState', context: context);

  @override
  PageState<bool> get deleteTaskState {
    _$deleteTaskStateAtom.reportRead();
    return super.deleteTaskState;
  }

  @override
  set deleteTaskState(PageState<bool> value) {
    _$deleteTaskStateAtom.reportWrite(value, super.deleteTaskState, () {
      super.deleteTaskState = value;
    });
  }

  late final _$getTasksAsyncAction =
      AsyncAction('HomeControllerBase.getTasks', context: context);

  @override
  Future<void> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  @override
  String toString() {
    return '''
state: ${state},
deleteTaskState: ${deleteTaskState}
    ''';
  }
}
