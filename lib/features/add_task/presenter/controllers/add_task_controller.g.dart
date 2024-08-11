// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTaskController on AddTaskControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'AddTaskControllerBase.state', context: context);

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

  late final _$addTaskAsyncAction =
      AsyncAction('AddTaskControllerBase.addTask', context: context);

  @override
  Future<void> addTask(dynamic context) {
    return _$addTaskAsyncAction.run(() => super.addTask(context));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
