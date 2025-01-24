import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Cities { sanaa }
abstract class MapDefaultValues {
   static Map<Cities, LatLng> defaultCitiesCoordinates = {
    Cities.sanaa: const LatLng(15.369445, 44.191006),
  };
   static final LatLngBounds yemenBounds = LatLngBounds(
    southwest: const LatLng(12.0, 42.0),
    northeast: const LatLng(19.0, 54.0),
  );
  static final LatLngBounds sanaaBounds = LatLngBounds(
    southwest: const LatLng(15.115482726333502, 43.91798310000898),
    northeast: const LatLng(15.59100968723285, 44.41591954350922),
  );
}


