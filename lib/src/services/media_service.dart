import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/media/put_media_request_model.dart';
import 'package:likeminds_chat_fl/src/models/media/put_media_response_model.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

class MediaService {
  final ApiManager apiManager;

  MediaService({required this.apiManager});

  Future<LMResponse<PutMediaResponseEntity>> putMultimedia(
      PutMediaRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.mediaUploadEndpoint,
            data: request.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: PutMediaResponseEntity.fromJson(response.data),
      );
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
