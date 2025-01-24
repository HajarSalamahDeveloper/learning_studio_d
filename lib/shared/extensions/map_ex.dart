import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Extension on [Position] to provide additional conversion methods.
extension PositionEx on Position {
  
  /// Converts a [Position] object to a [LatLng] object.
  ///
  /// Example usage:
  /// ```dart
  /// Position position = await Geolocator.getCurrentPosition();
  /// LatLng latLng = position.toLatLong();
  /// ```
  LatLng toLatLong() => LatLng(latitude, longitude);
}

/// Extension on [String] to provide conversion to [LatLng].
extension LatLngEx on String {
  
  /// Converts a string formatted as "latitude,longitude" to a [LatLng] object.
  ///
  /// Example usage:
  /// ```dart
  /// String coordinates = '37.4219983,-122.084';
  /// LatLng latLng = coordinates.toLatLong();
  /// ```
  LatLng toLatLong() => LatLng(double.parse(split(',').first), double.parse(split(',').last));
}
