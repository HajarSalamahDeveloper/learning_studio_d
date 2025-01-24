import 'package:app_skeleton/shared/extensions/padding_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
 
class AppDividerWidget extends StatelessWidget {
  final double? height, paddingW, paddingH;

  const AppDividerWidget({super.key, this.height, this.paddingW, this.paddingH});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.dividerColor,
      height: height,
    ).paddingHorizontal(paddingW ?? 16.w).paddingVertical(paddingH ?? 0);
  }
}
