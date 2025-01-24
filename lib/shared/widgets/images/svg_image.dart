import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(this.path, {this.width, this.height, this.color, this.fit, super.key});
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      //ignore: deprecated_member_use
      color: color,
      fit: fit ?? BoxFit.contain,
     );
  }
}
