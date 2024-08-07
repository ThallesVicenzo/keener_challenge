import 'package:flutter/material.dart';

import '../text/app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.sufixIconVisibility,
  });

  final String title;
  final void Function() onTap;
  final bool? sufixIconVisibility;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.deepPurple,
        ),
        height: 52,
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AppText(
                title,
                fontSize: FontSize.medium,
                style: MyTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Visibility(
              visible: sufixIconVisibility ?? true,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
