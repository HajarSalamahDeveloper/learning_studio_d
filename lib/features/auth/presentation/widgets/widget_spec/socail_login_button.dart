import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

import '../../../../../config/const/app_images.dart';
import '../../../../../config/style/app_colors.dart';
import '../../../../../shared/extensions/theme_contex.dart';
import '../../../../../shared/widgets/images/asset_image.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Google Button
        SocialLoginButton( nameImage: AppImages.imgGoogle,
         onPressed: () {
           
         },
         label: "continue_with_google",
         
         ),
         12.sizeW,
        
      SocialLoginButton( nameImage: AppImages.imgFacebook,
         onPressed: () {
           
         },
         label: "continue_with_facebook",
         
         ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key, this.onPressed, this.nameImage, this.label,
  });
 final void Function()? onPressed;
 final String? nameImage;
 final String? label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          // padding:  EdgeInsets.symmetric(vertical: 14.h),
          minimumSize: Size(176.w, 36.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: const BorderSide(color: AppColors.grayBorderColor),
          ),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
        icon:AssetImageWidget(
          nameImage??"",
          width: 24.w,
          height: 24.h,
        ),
        label:  TextWidget(
          label??"",
          style: theme.textTheme.titleSmall?.copyWith(color: AppColors.fontColor400),
        ),
      ),
    );
  }
}
