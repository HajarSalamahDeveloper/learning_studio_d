  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';

class AppDecoration {
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.cartBGColor,
        borderRadius: BorderRadius.circular(10.r),
      );
  static BoxDecoration get bodyCardDecoration => BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(18.r),
          topStart: Radius.circular(18.r),
        ),
      );
  static get blurDecoration => BoxDecoration(
        borderRadius: AppBorderRadius.radius10,
        gradient: LinearGradient(
          begin: const AlignmentDirectional(1.00, 0.00),
          end: const AlignmentDirectional(-1, 0),
          stops: const [0.0, 0.5, 1.0],
          colors: [AppColors.primaryColor.withOpacity(0.25), AppColors.primaryColor.withOpacity(0.08), AppColors.primaryColor.withOpacity(0.05)],
        ),
      );
}
