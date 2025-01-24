import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

/// A service class for handling location-related permissions and settings.
class PermissionServices {
  /// Handles location permission and optionally checks if the location service is enabled.
  ///
  /// Parameters:
  /// - [checkLocationEnabled]: A boolean flag indicating whether to check if the device's
  ///   location service is enabled. Defaults to `true`.
  ///
  /// Returns:
  /// - `true` if the location permission is granted and (if enabled) the location service is active.
  /// - `false` if the location permission is denied or the location service is disabled.
  ///
  /// Behavior:
  /// - If the location permission is denied or permanently denied, a permission request is made.
  /// - If `checkLocationEnabled` is `true`, the method verifies if the location service is enabled.
  ///   If it is disabled, it attempts to open the device's location settings.
  static Future<bool> handleLocationPermission(
      {bool checkLocationEnabled = true}) async {
    // Check the current status of location permission.
    PermissionStatus status = await Permission.location.status;

    // Request permission if it is denied or permanently denied.
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.location.request();
    }

    // If permission is not granted, return false immediately.
    if (!status.isGranted) {
      return false;
    }

    // Optionally check if the location service is enabled.
    if (checkLocationEnabled) {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      // If the location service is disabled, attempt to open settings and return false.
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return false;
      }
    }

    // Return true if permission is granted and (if enabled) location service is active.
    return true;
  }
}
