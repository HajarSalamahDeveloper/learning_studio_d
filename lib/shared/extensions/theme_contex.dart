// Access theme without BuildContext
   import 'package:flutter/material.dart';

import '../../config/const/app_values.dart';
import '../../config/style/app_colors.dart';
import '../../config/style/fonts_manager.dart';
import '../../config/themes/themes.dart';
import '../../core/services/routing/navigator_service.dart';

  ThemeData get theme {
    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) {
      throw Exception('Global context is not available. Make sure the app is initialized.');
    }
    return Theme.of(context);
  }
 class  ThemeManager {
   static TextTheme getTextTheme(Color textColor) {
    return TextTheme(
      bodyLarge: getRegularStyle(color: textColor, fontSize: FontSize.s16),
      bodyMedium: getRegularStyle(color: textColor, fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: textColor, fontSize: FontSize.s12),
      headlineLarge: getBoldStyle(color: textColor, fontSize: FontSize.s24),
      headlineMedium: getBoldStyle(color: textColor, fontSize: FontSize.s20),
      headlineSmall: getBoldStyle(color: textColor, fontSize: FontSize.s18),
      titleLarge: getSemiBoldStyle(color: textColor, fontSize: FontSize.s22),
      titleMedium: getSemiBoldStyle(color: textColor, fontSize: FontSize.s16),
      titleSmall: getSemiBoldStyle(color: textColor, fontSize: FontSize.s12),
      labelLarge: getMediumStyle(color: textColor, fontSize: FontSize.s16),
      labelMedium: getMediumStyle(color: textColor, fontSize: FontSize.s14),
      labelSmall: getMediumStyle(color: textColor, fontSize: FontSize.s12),
    );
  }

  // Text style methods
    static TextStyle getLightStyle({required Color color, double fontSize = FontSize.s14}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: AppValues.appFontFamily,
      color: color,
      fontWeight: FontWeight.w300,
    );
  }
  static TextStyle getRegularStyle({required Color color, double fontSize = FontSize.s14}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: AppValues.appFontFamily,
      color: color,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle getBoldStyle({required Color color, double fontSize = FontSize.s17}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: AppValues.appFontFamily,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getSemiBoldStyle({required Color color, double fontSize = FontSize.s20}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: AppValues.appFontFamily,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getMediumStyle({required Color color, double fontSize = FontSize.s14}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: AppValues.appFontFamily,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}

// Extension to access custom theme properties
extension CustomTheme on ThemeData {
  Color get appPrimaryColor => brightness == Brightness.light
      ? AppColors.primaryColor
      : AppColors.whiteColor;

  Color get fontColor => brightness == Brightness.light
      ? AppColors.blackColor
      : AppColors.whiteColor;

  // Access text styles directly from the theme
  TextStyle get regularStyle => ThemeManager.getRegularStyle(color: fontColor);
  TextStyle get boldStyle => ThemeManager.getBoldStyle(color: fontColor);
  TextStyle get semiBoldStyle => ThemeManager.getSemiBoldStyle(color: fontColor);
  TextStyle get mediumStyle => ThemeManager.getMediumStyle(color: fontColor);
  
  

}


   
 
  