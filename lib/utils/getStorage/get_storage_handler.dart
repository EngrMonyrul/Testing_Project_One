import 'package:get_storage/get_storage.dart';

class GetStorageHandler {
  final getStorageInstance = GetStorage();

  final String deviceToken = 'deviceToken';

  String get getDeviceToken => getStorageInstance.read(deviceToken) ?? '';

  void setDeviceToken({required String token}) =>
      getStorageInstance.write(deviceToken, token);
}
