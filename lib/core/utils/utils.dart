import 'package:flutter/material.dart';
import 'package:app_skeleton/core/logging/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Utility class containing various helper methods for common tasks.
class Utl {
  /// Clears the Flutter image cache to remove all cached images.
  static void resetCache() {
    PaintingBinding.instance.imageCache.clear();
  }

  /// Converts a list of `XFile` objects to a list of `File` objects.
  ///
  /// Requires the `image_picker` package.
  ///
  /// Returns:
  /// - A list of `File` objects created from the provided `XFile` objects.
  ///
  /// [xFiles]: The list of `XFile` objects to convert.
  /// ```dart
  /// static Future<List<File>> convertXFilesToFiles(List<XFile> xFiles) async {
  ///   final files = await Future.wait(xFiles.map((xFile) async {
  ///     final bytes = await xFile.readAsBytes();
  ///
  ///     final tempDir = Directory.systemTemp;
  ///     final tempFile = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
  ///     await tempFile.writeAsBytes(bytes);
  ///
  ///     return tempFile;
  ///   }));
  ///   return files;
  /// }
  /// ```

  /// Converts an `XFile` object to a Base64 string.
  ///
  /// Requires the `image_picker` package.
  ///
  /// Returns:
  /// - A Base64-encoded string representing the file's contents.
  ///
  /// [file]: The `XFile` to convert.
  /// ```dart
  /// static Future<String?> convertXFileToBase64(XFile file) async {
  ///   final bytes = await file.readAsBytes();
  ///   return base64Encode(bytes);
  /// }
  /// ```

  /// Shares the app's URL using the `share_plus` package.
  ///
  /// [googlePlayUrl]: URL of the app on Google Play.
  /// [appStoreUrl]: URL of the app on the App Store.
  /// [text]: Optional custom text for the share message.
  static void shareApp(String googlePlayUrl, String appStoreUrl, {String text = 'حمل التطبيق من هنا'}) {
    Share.share(
      '$text \nandroid : $googlePlayUrl\n ios : $appStoreUrl',
    );
  }

  /// Opens a URL using the `url_launcher` package.
  ///
  /// [urlPath]: The URL to open.
  /// [mode]: Launch mode (default is `LaunchMode.externalApplication`).
  ///
  /// Logs an error if the URL cannot be launched.
  static Future<void> openUrl(String urlPath, {LaunchMode mode = LaunchMode.externalApplication}) async {
    try {
      final url = Uri.parse(urlPath);
      final canLaunch = await canLaunchUrl(url);
      if (!canLaunch) {
        Logger.error('Cannot launch URL: $urlPath');
        return;
      }
      await launchUrl(url, mode: mode);
    } catch (e) {
      Logger.error(e);
    }
  }

  /// Converts a hexadecimal color string to a [Color] object.
  ///
  /// [hexString]: The hexadecimal string representing the color (e.g., `#FF5733`).
  ///
  /// Returns:
  /// - A [Color] object, or `null` if the input is invalid.
  static Color? hexToColor(String? hexString) {
    if (hexString == null) {
      return null;
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Fetches the device name using the `device_info` package.
  ///
  /// Requires the `device_info_plus` package.
  ///
  /// Returns:
  /// - A string representing the device name.
  /// ```dart
  /// static Future<String> getDeviceName() async {
  ///   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  ///   try {
  ///     if (Platform.isAndroid) {
  ///       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  ///       return '${androidInfo.manufacturer}-${androidInfo.model}';
  ///     } else {
  ///       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  ///       return 'Apple-${iosInfo.model}';
  ///     }
  ///   } catch (e) {
  ///     return 'phone';
  ///   }
  /// }
  /// ```

  /// Determines if the device is a physical device.
  ///
  /// Requires the `device_info` package.
  ///
  /// Exits the app if the device is not physical and the app is not in debug mode.
  /// ```dart
  /// static isPhysicalDevice() async {
  ///   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  ///   dynamic device;
  ///   if (Platform.isAndroid) {
  ///     device = await deviceInfo.androidInfo;
  ///   } else {
  ///     device = await deviceInfo.iosInfo;
  ///   }
  ///   if (!device.isPhysicalDevice && !kDebugMode) {
  ///     exit(0);
  ///   }
  /// }
  /// ```

  /// Converts a list of URLs to a list of `XFile` objects.
  ///
  /// Requires the `image_picker`, `dio`, and `path_provider` packages.
  ///
  /// [urls]: The list of URLs to convert.
  ///
  /// Returns:
  /// - A list of `XFile` objects created from the provided URLs.
  /// ```dart
  /// static Future<List<XFile>> convertUrlsToXFiles(List<String> urls) async {
  ///   List<XFile> xFiles = [];
  ///   final tempDir = await getTemporaryDirectory();
  ///   Dio dio = Dio();
  ///
  ///   try {
  ///     final futures = urls.map((url) async {
  ///       try {
  ///         final response = await dio.get<List<int>>(
  ///           url,
  ///           options: Options(responseType: ResponseType.bytes),
  ///         );
  ///         if (response.data != null) {
  ///           final parts = url.split('/');
  ///           final newFileName = parts[5];
  ///           final fileExtension = url.split('.').last.split('?').first;
  ///           final file = File('${tempDir.path}/$newFileName.$fileExtension');
  ///           await file.writeAsBytes(response.data!);
  ///           return XFile(file.path);
  ///         } else {
  ///           throw Exception('No data received from $url');
  ///         }
  ///       } catch (e) {
  ///         print('Error fetching image from $url: $e');
  ///         return null;
  ///       }
  ///     }).toList();
  ///
  ///     final results = await Future.wait(futures);
  ///     xFiles = results.whereType<XFile>().toList();
  ///   } catch (e) {
  ///     print('Error processing URLs: $e');
  ///   } finally {
  ///     dio.close();
  ///   }
  ///
  ///   return xFiles;
  /// }
  /// ```
}
