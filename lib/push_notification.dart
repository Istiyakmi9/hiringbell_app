import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    // get device fcm token
    final token = await _firebaseMessaging.getToken();
    debugPrint("Device token: $token");
  }

  // initialize local notification

  static Future localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher'
    );

    final DarwinInitializationSettings darwinInitializationSettingIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {}
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingAndroid,
      iOS: darwinInitializationSettingIOS
    );

    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
    .requestNotificationsPermission();

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap
    );
  }

  static void onNotificationTap(NotificationResponse notificationResponse) { }
}
