import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/app_decoration.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/shared/widgets/app_icon_widget.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

class AppListTileWidget extends StatelessWidget {
  final String title;
  final Widget? subTitle;
  final double ? height;
  final Function()? onTap;
  const AppListTileWidget({super.key, required this.title, this.onTap,this.subTitle,this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        width: double.infinity,
        height:height,
        decoration: AppDecoration.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  title,
                  style: AppTextStyle.s18W400,
                ),
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.avatarBgColor,
                  ),
                  child: AppIconWidget(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                  ),
                )
              ],
            ),
            if(subTitle != null)
              subTitle!,
          ],
        ),
      ),
    );
  }
}
