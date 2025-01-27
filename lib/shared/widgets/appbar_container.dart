import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';

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
        // const SvgAsset(AppImages.mountain).paddingEnd(15.w)
      ],
    );
  }
}
