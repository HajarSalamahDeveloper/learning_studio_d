import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/config/const/app_images.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/shared/extensions/padding_ex.dart';
import 'package:app_skeleton/shared/widgets/images/svg_image.dart';

class AppBarContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  const AppBarContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Container(
          width: double.infinity,
          height: height ?? 200.h,
          decoration: BoxDecoration(
            gradient: AppColors.appBarGradient,
          ),
          child: child,
        ),
        const SvgAsset(AppImages.mountain).paddingEnd(15.w)
      ],
    );
  }
}
