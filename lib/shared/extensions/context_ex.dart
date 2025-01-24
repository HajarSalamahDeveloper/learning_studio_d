import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide convenient access to common context-related properties and methods.
extension ContextEx on BuildContext {
  
  /// Returns the size of the current media query.
  Size get size => MediaQuery.of(this).size;

  /// Returns the shortest side of the current media query size.
  double get mediaQueryShortestSide => size.shortestSide;

  /// Returns the bottom padding of the keyboard from the current media query.
  double get keyboardBottomPadding => MediaQuery.of(this).viewInsets.bottom;

  /// Returns true if the keyboard is currently open, false otherwise.
  bool get isKeyboardOpen => keyboardBottomPadding > 0;

  /// Returns the height of the current media query size.
  double get height => size.height;

  /// Returns the width of the current media query size.
  double get width => size.width;

  /// Returns true if the device is considered a phone (based on media query shortest side).
  bool get isPhone => (mediaQueryShortestSide < 600);

  /// Returns true if the device is considered a small tablet (based on media query shortest side).
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  /// Returns true if the device is considered a large tablet (based on media query shortest side).
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  /// Returns true if the device is considered a tablet (based on media query shortest side).
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// Returns the height of the status bar from the current media query.
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Returns the scaffold state from the current context.
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Requests focus for the provided [FocusNode].
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Unfocuses the provided [FocusNode].
  void unFocus(FocusNode focus) {
    focus.unfocus();
  }
}
