// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable, unused_element

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // ignore: unused_field
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granded Permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granded proviosnal permission');
    } else {
      print('user denied permission');
    }
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        AndroidInitializationSettings('@dmipmap/ic_launcher');
    // print(message.notification!.title.toString());
    // print(message.notification!.body.toString());

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }

      showNotification(message);
    });
  } //done

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High importance Notification',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'Your Channal Description',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationsPlugin.show(
            0,
            message.notification!.title.toString(),
            message.notification!.body.toString(),
            notificationDetails);
      },
    );
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen(
      (event) {
        event.toString();
        print('refesh');
      },
    );
  }

  void initialize() {}
}
