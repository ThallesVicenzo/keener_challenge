import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/domain/entities/task_entity.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/pages/default_erro_page.dart';
import 'package:keener_challenge/core/presenter/widgets/app_bar/default_app_bar.dart';
import 'package:keener_challenge/core/presenter/widgets/buttons/app_primary_button.dart';
import 'package:keener_challenge/core/presenter/widgets/custom_padding/custom_padding_page.dart';
import 'package:keener_challenge/core/presenter/widgets/text%20fields/app_text_form_field.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/edit_task/presenter/controllers/edit_task_controller.dart';
import 'package:mobx/mobx.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({
    super.key,
    required this.entityList,
    required this.index,
    required this.controller,
  });

  final List<TaskEntity> entityList;
  final int index;
  final EditTaskController controller;

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late ReactionDisposer _disposer;
  late final TaskEntity entity;

  @override
  void initState() {
    super.initState();

    entity = widget.entityList[widget.index];

    widget.controller.setUpValues(
      entity.title,
      entity.description,
      entity.isCompleted,
    );

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
        title: 'Edit Task',
        hasLeading: true,
      ),
      body: Observer(
        builder: (context) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Switch(
                            activeTrackColor: Colors.green,
                            value: widget.controller.isCompleted!,
                            onChanged: (value) {
                              widget.controller.switchToggle(value);
                            },
                          ),
                        ],
                      ),
                      Form(
                        key: widget.controller.formKeys[0],
                        child: AppTextFormField(
                          controller: widget.controller.controllers[0],
                          validator: (value) =>
                              widget.controller.validateField(value),
                        ),
                      ),
                      Form(
                        key: widget.controller.formKeys[1],
                        child: AppTextFormField(
                          controller: widget.controller.controllers[1],
                          maxLines: 20,
                          validator: (value) =>
                              widget.controller.validateField(value),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppPrimaryButton(
                  title: 'Edit Task',
                  onTap: () {
                    widget.controller.editTask(
                      widget.entityList,
                      widget.index,
                      context,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
