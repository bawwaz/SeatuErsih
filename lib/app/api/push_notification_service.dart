import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class PushNotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
  );
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  static Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
      final token = await _firebaseMessaging.getToken();
    PushNotificationService.initLocalNotification();
    FirebaseMessaging.onMessage.listen(PushNotificationService.handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(
        PushNotificationService.handleBackgroundMessage);
    GetStorage().write('notificationToken', token);
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    RemoteNotification notification = message.notification!;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      payload: json.encode(message.data),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    final data = message.data;
    print('Data from background message: $data');
  }

  static Future<void> handleForegroundMessage(RemoteMessage message) async {
    final data = message.data;
    var token = GetStorage().read('token');

    if (data['route'] != null && token != null) {
      Get.toNamed(Routes.BTMNAVBAR, arguments: 0);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  static void onSelectNotification(NotificationResponse details) async {
    final payload = json.decode(details.payload!);
    var token = GetStorage().read('token');

    if (payload['route'] != null && token != null) {
      Get.toNamed(Routes.BTMNAVBAR, arguments: 0);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
