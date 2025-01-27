import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';
 
class AppDraggableSheet extends StatefulWidget {
  final double? minHeight, maxHeight, initialChildSize;
  final Widget child;
  final Color? backgroundColor;
  final bool showNotch;
  final DraggableScrollableController? controller;
  final EdgeInsetsGeometry? padding;
  const AppDraggableSheet({
    super.key,
    this.minHeight,
    this.maxHeight,
    this.initialChildSize,
    this.backgroundColor,
    this.showNotch = true,
    this.controller,
    this.padding,
    required this.child,
  });

  @override
  State<AppDraggableSheet> createState() => _AppDraggableSheetState();
}

class _AppDraggableSheetState extends State<AppDraggableSheet> {
  @override
  Widget build(BuildContext context) {
    double calculatedMaxHeight = ScreenUtil().screenHeight * 0.89;
    double calculatedMinHeight = ScreenUtil().screenHeight * 0.45;
    return DraggableScrollableSheet(
        controller: widget.controller,
        minChildSize: calculatedMinHeight / ScreenUtil().screenHeight,
        maxChildSize: calculatedMaxHeight / ScreenUtil().screenHeight,
        initialChildSize: widget.initialChildSize ?? calculatedMinHeight / ScreenUtil().screenHeight,
        snap: false,
        expand: false,
        snapAnimationDuration: const Duration(milliseconds: 150),
        builder: (context, scrollController) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              // gradient: AppColors.primaryBgGradient,
            ),
            child: Column(
              children: [
                if (widget.showNotch) _buildNotch(),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildNotch() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 67.w,
          height: 6.h,
          decoration: ShapeDecoration(
            color: AppColors.notchColor,
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.radius100,
            ),
          ),
        ),
        12.sizeH,
      ],
    );
  }
}
