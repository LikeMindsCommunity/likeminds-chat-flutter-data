import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';

// ignore: lines_longer_than_80_chars
/// LMNotifications class is responsible for handling all the notification related API calls
class LMNotifications {
  LMNotifications._();

  static final NotificationService _notifService =
      LMChatServiceProvider.instance.notificationService;

  static Future<LMResponse<void>> registerDevice(
      RegisterDeviceRequest request) async {
    return await _notifService.registerDevice(request);
  }
}
