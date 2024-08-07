import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/presenter/widgets/buttons/app_primary_button.dart';
import 'package:keener_challenge/core/presenter/widgets/color/ui_overlay_color.dart';
import 'package:keener_challenge/core/presenter/widgets/image/asset_image_widget.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';
import 'package:keener_challenge/core/routes/named_routes.dart';
import 'package:keener_challenge/core/utils/enums/app_images.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double titleOpacity = 0;
  double subtitleOpacity = 0;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
          titleOpacity = 1;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return UiOverlayColor(
      overlayColor: Colors.transparent,
      child: Scaffold(
        body: Column(
          children: [
            AssetImageWidget(
              image: AppImage.backgroundImage,
              fit: BoxFit.cover,
              size: Size(
                deviceSize.width,
                deviceSize.height * 0.6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                AnimatedOpacity(
                  opacity: titleOpacity,
                  duration: kThemeAnimationDuration,
                  onEnd: () {
                    setState(() {
                      subtitleOpacity = 1;
                    });
                  },
                  child: AppText(
                    'Keener.io Challenge',
                    fontSize: FontSize.large,
                    style: MyTextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                AnimatedOpacity(
                  opacity: subtitleOpacity,
                  duration: kThemeAnimationDuration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 20,
                    ),
                    child: AppText(
                      'This is a challenge app for Keener.io company and it works like a to-do list app.',
                      fontSize: FontSize.small,
                      style: MyTextStyle(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceSize.height * 0.1,
              width: deviceSize.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    left: subtitleOpacity == 1
                        ? deviceSize.width * 0.05
                        : deviceSize.width,
                    child: AppPrimaryButton(
                      title: 'Let\'s start',
                      onTap: () {
                        Modular.to.pushNamed(NamedRoutes.signUp.route);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
