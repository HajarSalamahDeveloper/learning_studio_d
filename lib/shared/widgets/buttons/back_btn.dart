import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:app_skeleton/config/const/app_radius.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/shared/widgets/animation/button_click_animation.dart';

class BackBtn extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final void Function()? onTap;
  const BackBtn({
    super.key,
    this.color,
    this.icon,
    this.size,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonClickAnimation(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          if (context.canPop()) context.pop();
        }
      },
      child: Container(
        width: width ?? 36.w,
        height: height ?? 36.h,
        decoration: ShapeDecoration(
          color: backgroundColor ?? AppColors.buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.radius10,
          ),
        ),
        child: Center(
          child: Builder(builder: (context) {
            return Center(
              child: Icon(
                icon ?? Icons.arrow_back_ios_new_rounded,
                color: color ?? AppColors.whiteColor,
                size: size ?? 16.sp,
              ),
            );
          }),
        ),
      ),
    );
  }
}
