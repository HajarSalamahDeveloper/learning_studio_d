import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learning_studio/core/logging/logger.dart';

/// Service class for managing local notifications using FlutterLocalNotificationsPlugin.
class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  LocalNotificationService._(); // Private constructor to prevent instantiation

  /// Initializes the local notification service with default Android settings.
  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(android: androidInitializationSettings);

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) async {
        Logger.notification('onDidReceiveNotificationResponse payload: $response');
        // if (response.actionId == 'DISMISS') {
        //   Logger.notification('Notification Dismissed');
        //   await _localNotificationsPlugin.cancel(response.id!); // Cancel the notification
        // }
      },
      // Uncomment to handle background notification responses
      // onDidReceiveBackgroundNotificationResponse: (response) {
      //   Logger.notification("onDidReceiveBackgroundNotificationResponse payload: ${response.notificationResponseType}");
      // },
    );
  }

  /// Shows a local notification with the specified ID, title, body, and optional payload.
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'general_channel',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
    );

    await _localNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Shows a pinned notification with the specified title and body.
  static Future<void> showPinnedNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'pinned_channel_id', // Channel ID
      'Pinned Notifications', // Channel name
      importance: Importance.max, // High importance
      priority: Priority.max, // High priority
      ongoing: true, // Makes the notification pinned
      autoCancel: true, // Prevents the notification from being dismissed when tapped

      actions: [
        AndroidNotificationAction(
          'DISMISS',
          'dismiss',
        ),
        AndroidNotificationAction(
          'PRINT',
          'print',
        ),
      ],
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      notificationDetails,
    );
  }
}
