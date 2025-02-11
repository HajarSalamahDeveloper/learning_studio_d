import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/const/app_values.dart';

import '../../shared/extensions/theme_contex.dart';
import '../style/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: AppValues.appFontFamily,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    
    textTheme: ThemeManager.getTextTheme(AppColors.blackColor), // Light theme text color
  iconTheme: IconThemeData(color: AppColors.primaryColor,
  size: 22.w,
  // weight: 20.w
  ),
  );

  static final darkTheme = ThemeData(
    fontFamily: AppValues.appFontFamily,
    brightness: Brightness.dark,
    primaryColor: AppColors.secondaryColor,
    textTheme: ThemeManager.getTextTheme(AppColors.whiteColor), // Dark theme text color
  );
}
  // Helper method to create a TextTheme
 