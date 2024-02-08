import 'package:flutter/material.dart';

import '../../../utils/getStorage/get_storage_handler.dart';
import '../../../utils/notifications/notification_handler.dart';

class NotificationSystem extends StatefulWidget {
  const NotificationSystem({super.key});

  @override
  State<NotificationSystem> createState() => _NotificationSystemState();
}

class _NotificationSystemState extends State<NotificationSystem> {
  NotificationHandler notificationHandler = NotificationHandler();
  GetStorageHandler getStorageHandler = GetStorageHandler();

  void notificationPermissionCheck() async {
    await notificationHandler.getNotificationPermission().then((value) {
      debugPrint(getStorageHandler.getDeviceToken);
    });
  }

  @override
  void initState() {
    notificationPermissionCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/photos/img_bg.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: const Scaffold(),
    );
  }
}
