import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/shared/widgets/buttons/buttons.dart';
import 'package:app_skeleton/shared/widgets/modals/app_bottomsheet.dart';

class AppModals {
  static Future showBottomSheet(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool isScrollControlled = true,
    bool animate = true,
    bool withBackBtn = true,
    double? height,
    double? bottomPadding,
    BorderRadiusGeometry? borderRadius,
    bool withScrollview = true,
  }) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        barrierColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        builder: (BuildContext ctx) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
              ),
              SlideInUp(
                animate: animate,
                duration: const Duration(milliseconds: 600),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppBottomsheet(
                    height: height,
                    bottomPadding: bottomPadding,
                    borderRadius: borderRadius,
                    withScrollview: withScrollview,
                    child: child,
                  ),
                ),
              ),
              if (withBackBtn)
                PositionedDirectional(
                  top: 40.h,
                  start: 16.w,
                  child: const BackBtn(),
                ),
            ],
          );
        });
  }

  static Future showSuccessSheet(BuildContext context, {required String orderId}) async {
    return await showBottomSheet(context, child: Builder(builder: (context) {
      return  SizedBox.shrink();
    }));
  }
}
