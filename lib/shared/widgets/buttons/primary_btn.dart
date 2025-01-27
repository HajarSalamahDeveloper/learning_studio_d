import 'package:flutter/material.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/shared/widgets/animation/button_click_animation.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';

class PrimaryBtn extends StatefulWidget {
  final Color? color;
  final String? text;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Widget? child;
  final String? icon;
  final bool isAnimated;
  final bool disabled;
  const PrimaryBtn(
      {super.key, this.text, this.color, this.borderRadius, this.onTap, this.width = double.infinity, this.height = 55, this.child, this.disabled = false, this.isAnimated = true, this.icon});

  @override
  State<PrimaryBtn> createState() => _PrimaryBtnState();
}

class _PrimaryBtnState extends State<PrimaryBtn> {
  @override
  Widget build(BuildContext context) {
    return widget.disabled
        ? _buildItem()
        : widget.isAnimated
            ? ButtonClickAnimation(
                onTap: widget.onTap,
                child: _buildItem(),
              )
            : GestureDetector(
                onTap: widget.onTap != null
                    ? () {
                        widget.onTap?.call();
                      }
                    : null,
                child: _buildItem(),
              );
  }

  Container _buildItem() {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: ShapeDecoration(
          color: widget.color ?? (widget.disabled ? AppColors.primaryDisabledColor : AppColors.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? AppBorderRadius.radius12,
          ),
        ),
        child: Builder(
          builder: (context) {
            if (widget.icon != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.text != null)
                    TextWidget(
                      widget.text!,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.pButtonTextStyle.copyWith(color: AppColors.primaryColor),
                    ),
                  SvgAsset(
                    widget.icon!,
                  )
                ],
              );
            }
            if (widget.text != null) {
              return Center(
                child: TextWidget(
                  widget.text!,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.pButtonTextStyle,
                ),
              );
            }
            return widget.child ?? const SizedBox.shrink();
          },
        ));
  }
}
