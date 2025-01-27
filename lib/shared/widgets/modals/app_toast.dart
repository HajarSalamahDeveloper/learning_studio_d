import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/core/services/routing/navigator_service.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

/// Helper class for displaying various types of Snackbars.
/// [note] pass the context whenever You can to avoid null context error
class AppToast {
  /// Displays an informational Snackbar.
  static void showInfoSnackBar({
    BuildContext? context,
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.primaryColor,
    SnackBarAction? action,
  }) {
    final scaffoldContext = context ?? NavigationService.navigatorKey.currentContext!;

    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: MediaQuery.of(scaffoldContext).size.height - 100, left: 10.w, right: 10.w),
        content: TextWidget(message),
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Displays an error Snackbar.
  static void showErrorSnackBar({
    BuildContext? context,
    String? message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.dangerColor,
    SnackBarAction? action,
  }) {
    final scaffoldContext = context ?? NavigationService.navigatorKey.currentContext!;

    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: MediaQuery.of(scaffoldContext).size.height - 100, left: 10.w, right: 10.w),
        content: TextWidget(message ?? ''),
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Displays a success Snackbar.
  static void showSuccessSnackBar({
    BuildContext? context,
    required String? message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.greenTxtColor,
    SnackBarAction? action,
  }) {
    final scaffoldContext = context ?? NavigationService.navigatorKey.currentContext!;

    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: MediaQuery.of(scaffoldContext).size.height - 100, left: 10.w, right: 10.w),
        content: TextWidget(
          message ?? '',
          maxLines: 4,
        ),
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
