import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';

class AppScaffoldBody extends StatelessWidget {
  const AppScaffoldBody({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: AppRadius.radius16,
            topStart: AppRadius.radius16,
          ),
        ),
        child: child

        );
  }
}
