import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

//TODO refactor this widget
class LoadingOverlayWidget extends StatelessWidget {
  final void Function()? onTap;
  const LoadingOverlayWidget({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
              width: 100.w,
              // height: 100.h,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                  FittedBox(child: TextWidget('الغاء', style: AppTextStyle.s16W400p))
                ],
              )),
        ),
      ),
    );
  }
}
