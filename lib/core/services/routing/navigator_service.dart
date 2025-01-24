import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate using GoRouter
  static Future<void> goTo(String routeName, {Map<String, String>? params}) async {
    GoRouter.of(navigatorKey.currentContext!).goNamed(routeName);
  }

  // Navigate and replace all routes
  static Future<void> goAndRemoveUntil(String routeName, {Map<String, String>? params}) async {
    GoRouter.of(navigatorKey.currentContext!).replaceNamed(routeName);
  }

  // Go back
  static void goBack() {
    GoRouter.of(navigatorKey.currentContext!).pop();
  }
}
