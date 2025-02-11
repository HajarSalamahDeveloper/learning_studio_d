import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';

import '../../../../config/const/app_images.dart';
import '../../../../config/style/app_colors.dart';
import '../../../../core/faker/dummy_network_image.dart';
import '../../../../shared/extensions/theme_contex.dart';
import '../../../../shared/widgets/app_txt_widget.dart';
import '../../../../shared/widgets/images/svg_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    // height: 54.h,
       padding: EdgeInsetsDirectional.only(start: 20.w,
        end: 20.w,top:7.h),
      decoration: BoxDecoration(
        // color: Colors.white,
        gradient: AppColors.appBarGradient,
       
      ),
      child: Row(
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 25.r,
            backgroundImage: CachedNetworkImageProvider(DNI.randImg()),
          ),
          const SizedBox(width: 12),
          // Name and Welcome Text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "hello",
                style:theme.textTheme.headlineSmall,
              ),
               Text(
                "User",
                style:theme.textTheme.headlineSmall,
                
              ),
            ],
          ).expanded(),
          // Notification Icon
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Soft Border Background
              Container(
                width: 36.w,
    height: 36.h,
                // padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.greenLightColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.whiteColor, width: 1), // Border color
                  boxShadow: [
                   AppColors.notfiBoxShadow
                  ],
                ),
                child:  Center(
                  child: InkWell(
                    child: SvgAsset(
                      AppImages.notfication,
                    )
                    // child: Icon(Iconsax.notification_copy,
                    
                    // size: 22,
                    // ),
                  ),
                ),
              ),
          
              // Notification Badge
              PositionedDirectional(
                top: -2,
                start: -10,
                child: Container(
                   padding:  EdgeInsets.symmetric(horizontal: 2.w,
                   ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.whiteColor, width: 1.w),
                  ),
                  child:  Center(
                    child: TextWidget(
                      "99+",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
