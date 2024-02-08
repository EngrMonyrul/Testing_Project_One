import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:testingprojectone/utils/getStorage/get_storage_handler.dart';

class NotificationHandler {
  FirebaseMessaging firebaseMessagingInstance = FirebaseMessaging.instance;
  GetStorageHandler getStorageHandler = GetStorageHandler();

  /*---------------> Getting Notification Permission <------------------*/
  Future<void> getNotificationPermission() async {
    NotificationSettings settings =
        await firebaseMessagingInstance.requestPermission(
      sound: true,
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Authorized Done');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('Provisional Authorized Done');
    } else {
      await AppSettings.openAppSettings();
    }

    await checkDeviceToken();
  }

  /*---------------> Checking device token <-----------------*/
  Future<void> checkDeviceToken() async {
    if (getStorageHandler.getDeviceToken == '') {
      await getDeviceToken();
    } else if (getStorageHandler.getDeviceToken != '') {
      await refreshDeviceToken();
    }
  }

  /*----------------> Getting Device Token <-------------------*/
  Future<void> getDeviceToken() async {
    await firebaseMessagingInstance
        .getToken()
        .then((value) => {getStorageHandler.setDeviceToken(token: value!)});
  }

  /*----------------> Refreshing Device Token <-------------------*/
  Future<void> refreshDeviceToken() async {
    firebaseMessagingInstance.onTokenRefresh.listen((event) {
      if (getStorageHandler.getDeviceToken != event.toString()) {
        getStorageHandler.setDeviceToken(token: event.toString());
      }
    });
  }
}
