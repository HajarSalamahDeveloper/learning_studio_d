import 'package:flutter/material.dart';
import 'package:app_skeleton/config/const/app_values.dart';

import '../style/app_colors.dart';

//Not Finished yet
class AppTheme {
  
  static final lightTheme = ThemeData(
    fontFamily: AppValues.appFontFamily,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    // scaffoldBackgroundColor: AppColor.backgroundColorLight,
    
     
  );

  static final darkTheme = ThemeData(
        fontFamily: AppValues.appFontFamily,

    brightness: Brightness.dark,
    primaryColor: AppColors.secondaryColor,
     
  );
}
extension CustomTheme on ThemeData {
  Color get appPrimaryColor => brightness == Brightness.light
      ? AppColors.primaryColor
      : AppColors.whiteColor;
  Color get frontColor => brightness == Brightness.light
      ? AppColors.whiteColor
      : AppColors.blackColor;
}