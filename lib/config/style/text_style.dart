import 'package:app_skeleton/core/services/routing/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/config/const/app_values.dart';
import 'package:app_skeleton/config/style/app_colors.dart';

class AppTextStyle {
  // Code Text Style
  static TextStyle get s10W700 => TextStyle(
        fontSize: 10.h,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get s12W300 => TextStyle(
        fontSize: 12.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s13W300h => TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 13.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s13W300 => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 13.h,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get s14W300 => TextStyle(
        fontSize: 14.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s14W300h => TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 14.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s14W300p => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s14W400 => TextStyle(
        fontSize: 14.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s14W500 => TextStyle(
        fontSize: 14.h,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get s15W300h => TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 15.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s16W300 => TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s16W300h => TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 16.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s16W400p => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s16W400 => TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s16W300w => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s17w300h => TextStyle(
        color: AppColors.hintTextColor,
        fontSize: 17.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s18W400w => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s18W400 => TextStyle(
        fontSize: 18.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s18W400p => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 18.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s18W300 => TextStyle(
        fontSize: 18.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s18W300w => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18.h,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get s20W700p => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20.h,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get s22W400p => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 22.h,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get validationText => TextStyle(
        color: Colors.red[700],
        fontSize: 12.h,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get pButtonTextStyle => TextStyle(
        color: _getTextColor(),
        fontSize: 16.h,
        fontWeight: FontWeight.w400,
      );
  static Color _getTextColor({Color lightColor=AppColors.blackColor, Color darkColor=AppColors.whiteColor}) {
    return Theme.of(NavigationService.navigatorKey.currentContext!).brightness == Brightness.dark
        ? darkColor  
        : lightColor;
  }

//Map<String, Style> style = const {}
  static Map<String, Style> get htmlStyle => {
        '*': Style(fontFamily: AppValues.appFontFamily),
        'h1': Style(color: AppColors.primaryColor),
        'h2': Style(color: AppColors.primaryColor),
        'h3': Style(color: AppColors.primaryColor),
        'h4': Style(color: AppColors.primaryColor),
        'h5': Style(color: AppColors.primaryColor),
        'h6': Style(color: AppColors.primaryColor),
        'p': Style(color: AppColors.blackColor),
        'li': Style(color: AppColors.blackColor),
      };
}
