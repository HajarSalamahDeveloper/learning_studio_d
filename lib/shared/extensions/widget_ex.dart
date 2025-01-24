import 'package:flutter/material.dart';

/// Extension on [Widget] to provide additional utility methods for widgets.
extension WidgetEx on Widget {
  
  /// Conditionally renders this widget based on [visible].
  ///
  /// If [visible] is true, returns this widget. Otherwise, returns [defaultWidget] or an empty SizedBox.
  ///
  /// Example usage:
  /// ```dart
  /// myWidget.visible(isVisible);
  /// ```
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this : (defaultWidget ?? const SizedBox.shrink());
  }

  /// Centers this widget using a [Center] widget.
  ///
  /// Example usage:
  /// ```dart
  /// myWidget.center();
  /// ```
  Widget center() => Center(child: this);

  /// Adds a SizedBox around this widget with optional height ([h]) and width ([w]).
  ///
  /// Example usage:
  /// ```dart
  /// myWidget.sized(h: 100, w: 200);
  /// ```
  Widget sized({double? h, double? w}) => SizedBox(height: h, width: w, child: this);

  /// Expands this widget within a parent widget using [Expanded].
  ///
  /// [flex] controls how much space this widget occupies relative to other expanded widgets in the same context.
  ///
  /// Example usage:
  /// ```dart
  /// myWidget.expanded();
  /// ```
  Widget expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );
}
