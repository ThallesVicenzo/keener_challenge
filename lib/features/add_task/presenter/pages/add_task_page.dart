import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/pages/default_erro_page.dart';
import 'package:keener_challenge/core/presenter/widgets/app_bar/default_app_bar.dart';
import 'package:keener_challenge/core/presenter/widgets/buttons/app_primary_button.dart';
import 'package:keener_challenge/core/presenter/widgets/custom_padding/custom_padding_page.dart';
import 'package:keener_challenge/core/presenter/widgets/text%20fields/app_text_form_field.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/add_task/presenter/controllers/add_task_controller.dart';
import 'package:mobx/mobx.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key, required this.controller});

  final AddTaskController controller;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _disposer = reaction(
      (_) => widget.controller.state,
      (state) {
        if (state is ErrorState) {
          Modular.to.pushNamed(
            NamedRoutes.defaultError.route,
            arguments: ErrorPageParams(
              errorlog: state.asError.message,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Add Task',
        hasLeading: true,
      ),
      body: Observer(builder: (context) {
        if (widget.controller.state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomPaddingPage(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Form(
                      key: widget.controller.formKeys[0],
                      child: AppTextFormField(
                        hintText: 'Task title...',
                        validator: (value) =>
                            widget.controller.validateField(value),
                        controller: widget.controller.controllers[0],
                      ),
                    ),
                    Form(
                      key: widget.controller.formKeys[1],
                      child: AppTextFormField(
                        hintText: 'description...',
                        maxLines: 20,
                        validator: (value) =>
                            widget.controller.validateField(value),
                        controller: widget.controller.controllers[1],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppPrimaryButton(
                sufixIconVisibility: false,
                title: 'Create Task',
                onTap: () {
                  widget.controller.addTask(context);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
