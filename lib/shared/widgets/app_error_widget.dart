import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/const/app_images.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/core/network/api_exception.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';

/// Use this Widget when you have error in your app
class AppErrorWidget extends StatelessWidget {
  final ApiException error;
  final VoidCallback? onTryAgain;

  const AppErrorWidget({
    super.key,
    required this.error,
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SvgAsset(AppImages.emptyContent),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            TextWidget(
              error.statusCode.toString(),
              style: AppTextStyle.s16W400p,
              textAlign: TextAlign.center,
            ),
            TextWidget(
              error.message,
              style: AppTextStyle.s16W400p,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            if (onTryAgain != null)
              PrimaryBtn(
                isAnimated: false,
                onTap: onTryAgain,
                text: 'retry',
              )
          ],
        ),
      ],
    ).sized(w: double.infinity, h: 300.h);
  }
}
