import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel
      _androidChannel = AndroidNotificationChannel(
    'laundry_status_channel',
    'Laundry Status',
    description:
        'Notification for laundry transaction status',
    importance: Importance.high,
  );

  static Future<void> initialize() async {
    const androidSettings =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings =
        InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
    );

    final androidImplementation =
        _notificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>();

    await androidImplementation
        ?.createNotificationChannel(
      _androidChannel,
    );

    await androidImplementation
        ?.requestNotificationsPermission();
  }

  static Future<void>
      showLaundryFinishedNotification() async {
    const androidDetails =
        AndroidNotificationDetails(
      'laundry_status_channel',
      'Laundry Status',
      channelDescription:
          'Notification for laundry transaction status',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails =
        NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      1,
      'Laundry Selesai',
      'Pesanan Anda telah selesai diproses dan siap diambil.',
      notificationDetails,
    );
  }
}
