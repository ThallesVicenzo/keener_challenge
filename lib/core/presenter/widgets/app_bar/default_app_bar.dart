import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../text/app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.height = 65,
    required this.title,
    required this.hasLeading,
    this.leading,
    this.color,
  });

  final double height;
  final String title;
  final bool hasLeading;
  final void Function()? leading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.white,
      automaticallyImplyLeading: hasLeading,
      leading: Visibility(
        visible: hasLeading,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: leading ??
              () {
                Modular.to.pop();
              },
        ),
      ),
      centerTitle: true,
      title: AppText(
        title,
        fontSize: FontSize.medium,
        style: MyTextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
