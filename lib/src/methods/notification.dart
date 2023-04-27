import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';

class LMNotifications {
  LMNotifications._();

  static final NotificationService _notifService =
      GetIt.instance<NotificationService>();

  static Future<LMResponse<RegisterDeviceResponse>> registerDevice(
      RegisterDeviceRequest request) async {
    final response = await _notifService.registerDevice(request);
    return LMResponse<RegisterDeviceResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }
}
