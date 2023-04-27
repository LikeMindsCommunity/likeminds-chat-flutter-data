import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';

class NotificationRepository {
  final NotificationService notificationService;

  NotificationRepository({required this.notificationService});

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    return await notificationService.registerDevice(request);
  }
}
