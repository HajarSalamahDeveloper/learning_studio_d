import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  final String name;
  final double? height, width;
  final BoxFit? fit;
  final Color? color;
  final AlignmentGeometry alignment;
  const AssetImageWidget(
    this.name, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment:alignment ,


    );
  }
}
