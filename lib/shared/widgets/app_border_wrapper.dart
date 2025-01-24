import 'package:flutter/material.dart';
import 'package:app_skeleton/config/style/app_colors.dart';

class BorderWrapper extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final bool enabled;

  const BorderWrapper({
    super.key,
    required this.child,
    this.borderColor = AppColors.dangerColor,
    this.borderWidth = 1,
    this.borderRadius,
    this.enabled=true
  });

  @override
  Widget build(BuildContext context) {
    return 
    enabled?
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: borderRadius, // Optional for rounded corners
      ),
      child: child,
    ):child;
  }
}
