import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppText(
        'Are you sure you want to log out?',
        fontSize: FontSize.medium,
        style: MyTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: AppText(
            'Yes',
            fontSize: FontSize.mediumSmall,
            style: MyTextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: AppText(
            'No',
            fontSize: FontSize.mediumSmall,
            style: MyTextStyle(color: Colors.white),
          ),
        ),
      ],
      backgroundColor: Colors.deepPurple,
    );
  }
}
