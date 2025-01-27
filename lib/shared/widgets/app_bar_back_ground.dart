import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_images.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';

class AppBarBackGround extends StatelessWidget {
  const AppBarBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            // child: SvgAsset(
              
            //   // AppImages.appbarBG,
            //   height: 178.h,
            //   fit: BoxFit.fill,
            // ),
          );
  }
}