import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/page_state.dart';
import 'package:keener_challenge/core/presenter/pages/default_erro_page.dart';
import 'package:keener_challenge/core/presenter/widgets/app_bar/default_app_bar.dart';
import 'package:keener_challenge/core/presenter/widgets/custom_padding/custom_padding_page.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:mobx/mobx.dart';

import '../components/floating_button.dart';
import '../components/logout_dialog.dart';
import '../components/task_title.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    widget.controller.getTasks();

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
      appBar: DefaultAppBar(
        title: 'Home',
        hasLeading: true,
        leading: () {
          showDialog(
            context: context,
            builder: (context) => LogoutDialog(
              onPressed: () async {
                widget.controller.logout();
              },
            ),
          );
        },
      ),
      body: Observer(
        builder: (context) {
          final state = widget.controller.state;
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.asSuccess.isEmpty) {
            return const Center(
              child: AppText(
                'You do not have any tasks, please create one!',
              ),
            );
          }
          return CustomPaddingPage(
            child: RefreshIndicator(
              onRefresh: widget.controller.getTasks,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.asSuccess.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TaskTile(
                          title: state.asSuccess[index].title,
                          isCompleted: state.asSuccess[index].isCompleted,
                          onTap: () {
                            Modular.to.pushNamed(
                              NamedRoutes.editTask.route,
                              arguments: {
                                'title': state.asSuccess[index].title,
                                'description':
                                    state.asSuccess[index].description,
                                'isCompleted':
                                    state.asSuccess[index].isCompleted,
                              },
                            );
                          },
                          confirmDismiss: (p0) async {
                            await widget.controller.deleteTask(
                              state.asSuccess[index],
                            );
                            return true;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingButton(
        onTap: () {
          Modular.to.pushNamed(NamedRoutes.addTask.route);
        },
      ),
    );
  }
}
