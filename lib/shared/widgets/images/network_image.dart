import 'package:learning_studio/shared/extensions/string_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/const/app_images.dart';
import 'package:learning_studio/config/const/app_radius.dart';
 import 'package:learning_studio/shared/widgets/images/svg_image.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays an image from a network URL with optional properties
/// for customization such as border radius, color overlay, gradient, and more.
///
/// If the provided [url] is not a valid image URL, it defaults to showing
/// a placeholder SVG asset. This widget also supports a skeleton loading effect
/// as a loading indicator while the image is being fetched.
class ImageNetwork extends StatelessWidget {
  /// Creates an [ImageNetwork] widget.
  ///
  /// The [url] is required and specifies the image URL to load. If the [url]
  /// is invalid or null, a fallback SVG asset is displayed.
  const ImageNetwork({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.withGradient,
    this.fit,
    this.border,
    this.withSkeleton = true,
    this.alignment,
  });

  /// The URL of the image to display.
  final String? url;

  /// Indicates whether to apply a gradient overlay to the image.
  final bool? withGradient;

  /// The height of the image.
  final double? height;

  /// The color overlay for the image.
  final Color? color;

  /// The width of the image.
  final double? width;

  /// The border radius to apply to the image.
  final BorderRadiusGeometry? borderRadius;

  /// The box-fit property to control how the image should fit within its bounds.
  final BoxFit? fit;

  /// The border to apply to the image container.
  final Border? border;

  /// The alignment of the image within its container.
  final AlignmentGeometry? alignment;

  /// Indicates whether to show a skeleton loading effect while loading the image.
  final bool withSkeleton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: borderRadius,
      ),
      alignment: alignment,
      child: ClipRRect(
        borderRadius: borderRadius ?? AppBorderRadius.radius0,
        child: url.isImageUrl()
            ? CachedNetworkImage(
                imageUrl: url!,
                fit: fit ?? BoxFit.contain,
                height: height,
                width: width,
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildErrorWidget(),
              )
            : _buildErrorWidget(),
      ),
    );
  }

  /// Builds the skeleton placeholder while the image is loading.

  Widget _buildPlaceholder() {
    return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
          ),
        ));
  }

  /// Builds the fallback error widget when the image fails to load or URL is invalid.
  Widget _buildErrorWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: const SvgAsset(
        AppImages.logo,
        fit: BoxFit.contain,
      ),
    );
  }
}
