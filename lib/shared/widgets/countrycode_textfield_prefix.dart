import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

class CountryCodeTextFieldPrefix extends StatelessWidget {
  const CountryCodeTextFieldPrefix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWidget(
          '967+',
          style: AppTextStyle.s16W300h,
          textAlign: TextAlign.center,
        ).sized(w: 40.w),
        Container(
          color: AppColors.indicatorUnselectedColor,
          width: 1.w,
          height: 31.h,
        ).paddingHorizontal(10.w)
      ],
    );
  }
}
