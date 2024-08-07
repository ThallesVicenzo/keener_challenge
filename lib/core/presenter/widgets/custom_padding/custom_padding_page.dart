import 'package:flutter/cupertino.dart';

const double defaultTopPadding = 28;
const double defaultBottomPadding = 30;
const double defaultRightPadding = 22;
const double defaultLeftPadding = 22;

class CustomPaddingPage extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  final bool onlyPaddingHorizontal;
  final double? topPadding;
  const CustomPaddingPage({
    super.key,
    this.onlyPaddingHorizontal = false,
    this.topPadding,
    this.padding = const EdgeInsets.only(
      left: defaultLeftPadding,
      right: defaultRightPadding,
      top: defaultTopPadding,
      bottom: defaultBottomPadding,
    ),
    required this.child,
  });

  static EdgeInsetsGeometry get defaultPadding => const EdgeInsets.only(
        left: defaultLeftPadding,
        right: defaultRightPadding,
        top: defaultTopPadding,
        bottom: defaultBottomPadding,
      );

  @override
  Widget build(BuildContext context) {
    var newPadding = topPadding != null
        ? EdgeInsets.only(
            bottom: defaultBottomPadding,
            left: defaultLeftPadding,
            right: defaultRightPadding,
            top: topPadding!,
          )
        : padding;
    onlyPaddingHorizontal
        ? newPadding = const EdgeInsets.only(
            left: defaultLeftPadding,
            right: defaultRightPadding,
          )
        : null;
    return Padding(
      key: key,
      padding: newPadding,
      child: child,
    );
  }
}
