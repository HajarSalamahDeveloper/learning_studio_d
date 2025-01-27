import 'package:learning_studio/config/const/app_values.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:learning_studio/config/local_notifications/local_notifications.dart';
import 'package:learning_studio/core/logging/logger.dart';

/// Service class for handling Firebase Cloud Messaging (FCM) integration.
class FCMService {
  FCMService._(); // Private constructor to prevent instantiation

  /// Initializes FCM service by requesting notification permissions,
  /// initializing local notifications, setting up FCM message listeners,
  /// and retrieving the FCM token.
  static Future<void> initializeFCM() async {
    await _requestNotificationPermission();
    await LocalNotificationService.initialize();
    _setupFCMListeners();
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Logger.notification("FCM Token: $token");
      // Send the token to the server if needed
    } catch (e) {
      Logger.notification("Failed to get FCM token: $e");
    }
  }

  /// Requests notification permissions if not already granted.
  static Future<void> _requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      final result = await Permission.notification.request();
      if (!result.isGranted) {
        Logger.notification("Notification permission denied");
      }
    }
  }

  /// Sets up FCM message listeners for foreground and background messages.
  static void _setupFCMListeners() {
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger.notification('onMessageOpenedApp');
    });
  }

  /// Handles foreground FCM notifications by displaying local notifications.
  static void _handleForegroundNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null && notification.android != null) {
      LocalNotificationService.showNotification(
        id: notification.hashCode,
        title: notification.title ?? AppValues.appName,
        body: notification.body ?? AppValues.appName,
        payload: notification.title,
      );
    }
  }

  /// Handles background FCM messages by displaying pinned notifications.
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    Logger.notification('BackgroundHandler');
    // if (message.data.containsKey('data')) {
    //   LocalNotificationService.showPinnedNotification(
    //     title: message.notification?.title ?? AppValues.appName,
    //     body: message.notification?.body ?? AppValues.appName,
    //   );
    // }
  }
}
