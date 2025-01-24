import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/config/const/app_radius.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/config/style/text_style.dart';
import 'package:app_skeleton/shared/widgets/animation/button_click_animation.dart';
import 'package:app_skeleton/shared/widgets/app_txt_widget.dart';

class SecondaryBtn extends StatefulWidget {
  final Color? color;
  final String? text;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Widget? child;
  final bool isAnimated;
  const SecondaryBtn({
    super.key,
    this.text,
    this.color,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
    this.child,
    this.textStyle,
    this.isAnimated = true,
  });

  @override
  State<SecondaryBtn> createState() => _SecondaryBtnState();
}

class _SecondaryBtnState extends State<SecondaryBtn> {
  @override
  Widget build(BuildContext context) {
    return widget.isAnimated
        ? ButtonClickAnimation(
            onTap: widget.onTap,
            child: _buildItem(),
          )
        : GestureDetector(
            onTap: () {
              widget.onTap?.call();
            },
            child: _buildItem(),
          );
  }

  Container _buildItem() {
    return Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 44.h,
        decoration: BoxDecoration(
            color: widget.color ?? AppColors.secondaryColor,
            // border: Border.all(
            //   color: AppColors.primaryColor,
            //   width: 1.2.w,
            // ),
            borderRadius: widget.borderRadius ?? AppBorderRadius.radius12),
        child: Builder(
          builder: (context) {
            if (widget.text != null) {
              return Center(
                child: TextWidget(
                  widget.text!,
                  textAlign: TextAlign.center,
                  style: widget.textStyle ?? AppTextStyle.pButtonTextStyle.copyWith(color: AppColors.primaryColor),
                ),
              );
            }
            return widget.child ?? const SizedBox.shrink();
          },
        ));
  }
}
