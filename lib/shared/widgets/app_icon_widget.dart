import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;

  const AppIconWidget(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
