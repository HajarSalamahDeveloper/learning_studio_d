import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/text_style.dart';
 import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/back_btn.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        45.sizeH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackBtn(),
            TextWidget(
              title,
              style: AppTextStyle.s18W400w,
            ),
            36.sizeW,
          ],
        ).paddingHorizontal(16.w),
        16.sizeH,
      ],
    );
  }
}