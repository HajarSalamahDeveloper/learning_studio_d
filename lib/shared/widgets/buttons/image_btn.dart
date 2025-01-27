import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';

class ImageBtn extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final Color? color;
  final double? size;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final void Function()? onTap;
  const ImageBtn({
    super.key,
    this.image,
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
    return InkWell(
      onTap: () {
        onTap?.call();
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
            if (image != null) {
              return SvgAsset(
                image!,
                height: size ?? 24.sp,
                width: size ?? 24.sp,
                color: color ?? AppColors.whiteColor,
              );
            }
            if (icon != null) {
              return Center(
                child: Icon(
                  icon!,
                  color: color ?? AppColors.whiteColor,
                  size: size ?? 24.sp,
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
