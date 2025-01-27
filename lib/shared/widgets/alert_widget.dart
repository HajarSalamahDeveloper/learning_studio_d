import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';
import 'package:learning_studio/shared/widgets/app_scaffold_body.dart';

class AlertWidget extends StatelessWidget {
  final String image;
  final String title;
  final double? height;
  final String? subTitle;
  final String? buttonTitle;
  final bool withScafold;
  final void Function()? onTap;
  const AlertWidget({super.key, required this.image, this.height, required this.title, this.subTitle, this.buttonTitle, this.onTap, this.withScafold = true});

  @override
  Widget build(BuildContext context) {
    return withScafold
        ? AppScaffoldBody(
            child: _buildComponet(),
          )
        : _buildComponet();
  }

  SizedBox _buildComponet() {
    return SizedBox(
      width: double.infinity,
      height: height ?? 400.h,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          100.sizeH,
          SvgAsset(image, width: 200.w, height: 200.h),
          TextWidget(title, style: AppTextStyle.s20W700p),
          if (subTitle != null)
            TextWidget(
              subTitle,
              style: AppTextStyle.s17w300h,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),
          40.sizeH,
          if (buttonTitle != null)
            PrimaryBtn(
              height: 47.h,
              width: 173.w,
              onTap: onTap,
              text: buttonTitle,
            )
        ],
      ),
    );
  }
}

class AlertWidget2 extends StatelessWidget {
  final String image;
  final String title;
  final double? height;
  final String? subTitle;
  final String? buttonTitle;
  final bool withScafold;
  final void Function()? onTap;
  const AlertWidget2({super.key, required this.image, this.height, required this.title, this.subTitle, this.buttonTitle, this.onTap, this.withScafold = true});

  @override
  Widget build(BuildContext context) {
    return withScafold
        ? AppScaffoldBody(
            child: _buildComponet(),
          )
        : _buildComponet();
  }

  Widget _buildComponet() {
    return Stack(
      children: [
        SvgAsset(image) ,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            TextWidget(
              title,
              style: AppTextStyle.s16W400p,
              textAlign: TextAlign.center,
            ),
            TextWidget(
              subTitle,
              style: AppTextStyle.s16W400p,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            if (buttonTitle != null)
              PrimaryBtn(
                isAnimated: true,
                onTap: onTap,
                text: buttonTitle,
              )
          ],
        ),
      ],
    );
  }
}
