// import 'package:firebase_remote_config/firebase_remote_config.dart';

// class FirebaseRemoteConfigService {
//   final FirebaseRemoteConfig _remoteConfig;

//   FirebaseRemoteConfigService(this._remoteConfig);

//   /// Initialize the Remote Config instance with default values and fetch the latest config.
//   Future<void> initialize({Map<String, dynamic>? defaultValues}) async {
//     try {
//       // Set default values (optional)
//       if (defaultValues != null) {
//         await _remoteConfig.setDefaults(defaultValues);
//       }

//       // Fetch and activate the latest config
//       await _remoteConfig.fetchAndActivate();
//     } catch (e) {
//       throw Exception('Failed to initialize Firebase Remote Config: ${e.toString()}');
//     }
//   }

//   /// Fetches a string value from the Remote Config by key.
//   String getString(String key) {
//     try {
//       return _remoteConfig.getString(key);
//     } catch (e) {
//       throw Exception('Failed to fetch Remote Config value for key "$key": ${e.toString()}');
//     }
//   }
  

//   /// Fetches an integer value from the Remote Config by key.
//   int getInt(String key) {
//     try {
//       return _remoteConfig.getInt(key);
//     } catch (e) {
//       throw Exception('Failed to fetch Remote Config value for key "$key": ${e.toString()}');
//     }
//   }

//   /// Fetches a double value from the Remote Config by key.
//   double getDouble(String key) {
//     try {
//       return _remoteConfig.getDouble(key);
//     } catch (e) {
//       throw Exception('Failed to fetch Remote Config value for key "$key": ${e.toString()}');
//     }
//   }

//   /// Fetches a boolean value from the Remote Config by key.
//   bool getBool(String key) {
//     try {
//       return _remoteConfig.getBool(key);
//     } catch (e) {
//       throw Exception('Failed to fetch Remote Config value for key "$key": ${e.toString()}');
//     }
//   }
// }