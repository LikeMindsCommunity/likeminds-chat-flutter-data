import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';

class LMNotifications {
  LMNotifications._();

  static final NotificationService _notifService =
      GetIt.instance<NotificationService>();

  static Future<LMResponse<void>> registerDevice(
      RegisterDeviceRequest request) async {
    return await _notifService.registerDevice(request);
  }
}
