import 'package:flutter/material.dart';
import 'package:testingprojectone/common/widgets/app_bar.dart';
import 'package:testingprojectone/utils/getStorage/get_storage_handler.dart';
import 'package:testingprojectone/utils/notifications/notification_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return const Scaffold(
      body: CustomAppbar(
        showBackButton: false,
        title: Column(
          children: [
            Text('Flutter Testing Project',
                style: TextStyle(color: Colors.white)),
            Text('Flutter Notification',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
