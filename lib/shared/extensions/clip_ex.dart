import 'package:flutter/material.dart';

/// Extension on [Widget] to provide additional methods for adding custom corner radii
/// and clipping behavior to widgets.
extension WidgetEx on Widget {
  /// Clips the widget with a [ClipRRect] using custom corner radii for each side.
  ///
  /// [bottomLeft], [bottomRight], [topLeft], and [topRight] specify the radius for 
  /// the respective corners in pixels. Default is 0 for all corners.
  ///
  /// [clipBehavior] determines the clip behavior. Default is [Clip.antiAliasWithSaveLayer].
  ///
  /// Example usage:
  /// ```dart
  /// Container().clipOnly(bottomLeft: 10, topRight: 20)
  /// ```
  ClipRRect clipOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
    Clip clipBehavior = Clip.antiAliasWithSaveLayer,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Clips the widget with a [ClipRRect] using the same corner radius for all corners.
  ///
  /// [radius] specifies the radius for all corners in pixels.
  ///
  /// [clipBehavior] determines the clip behavior. Default is [Clip.antiAliasWithSaveLayer].
  ///
  /// Example usage:
  /// ```dart
  /// Container().clipAll(15)
  /// ```
  ClipRRect clipAll(
    double radius, {
    Clip clipBehavior = Clip.antiAliasWithSaveLayer,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
