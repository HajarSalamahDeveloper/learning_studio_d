import 'package:flutter/material.dart';
import 'dart:ui';

class PopupWidget extends StatelessWidget {
  final Widget child;
  final bool isDismissible;

  const PopupWidget({
    super.key,
    required this.child,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: child,
    );
  }

  static Future<dynamic> showPopup({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierColor: Colors.transparent,
      builder: (context) {
        return PopupWidget(
          isDismissible: isDismissible,
          child: child,
        );
      },
    );
  }
}
