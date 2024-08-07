import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';

import 'core/presenter/widgets/ui_overlay_color.dart';

class KeenerChallenge extends StatelessWidget {
  const KeenerChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(NamedRoutes.welcome.route);
    return MaterialApp.router(
      title: 'Keener-Challenge',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: UiOverlayColor(
            child: child!,
          ),
        );
      },
    );
  }
}
