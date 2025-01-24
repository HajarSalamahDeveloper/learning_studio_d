import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

/// A custom painter for drawing a dashed border with rounded corners.
/// Example usage:
/// ```dart
/// CustomPaint(
/// painter: DashedBorderPainter(
///   color: AppColors.tagColor,
///   strokeWidth: 2,
///   dashWidth: 10,
///  dashSpace: 10,
/// radius: 8,
/// ),
///  child: Container(
///   padding: EdgeInsets.all(8.r),
///   width: double.infinity,
///   decoration: BoxDecoration(
///     color: AppColors.whiteColor,
///     borderRadius: BorderRadius.circular(8.r),
///   ),
/// ),
/// ```
///  )
class DashedBorderPainter extends CustomPainter {
  final Color color; // Color of the dashed border
  final double strokeWidth; // Width of the border stroke
  final double dashWidth; // Width of each dash
  final double dashSpace; // Space between each dash
  final double radius; // Radius for rounded corners

  /// Constructs a [DashedBorderPainter] with the specified parameters.
  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Create a rounded rectangle with specified radius
    final RRect outerRect = RRect.fromRectAndRadius(
      Offset.zero & size, // Rectangle that covers the entire widget size
      Radius.circular(radius), // Apply the corner radius
    );

    final Path path = Path()
      ..addRRect(outerRect); // Add the rounded rectangle to the path

    // Create a dashed effect by drawing segments of the path
    final Path dashedPath = Path();
    double totalLength =
        path.computeMetrics().fold(0.0, (sum, metric) => sum + metric.length);
    double dashLength = dashWidth + dashSpace;
    double currentDistance = 0.0;

    while (currentDistance < totalLength) {
      for (final PathMetric metric in path.computeMetrics()) {
        double dashStart = currentDistance;
        double dashEnd = min(currentDistance + dashWidth, metric.length);

        dashedPath.addPath(
          metric.extractPath(
              dashStart, dashEnd), // Extract the path segment for the dash
          Offset.zero,
        );

        currentDistance += dashLength;
      }
    }

    canvas.drawPath(dashedPath, paint); // Draw the dashed path
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
