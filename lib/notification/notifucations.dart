import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class Notofocation {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static ontap(NotificationResponse notificationResponse) {}
  Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: ontap,
      onDidReceiveBackgroundNotificationResponse: ontap,
    );
  }

  Future basicnotofication(String title, body) async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails('id1', 'basic'),
    );

    await flutterLocalNotificationsPlugin.show(0, title, body, details);
  }

  Future requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }
}
