import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/media/put_media_request_model.dart';
import 'package:likeminds_chat_fl/src/models/media/put_media_response_model.dart';

class MediaService {
  final ApiManager apiManager;

  MediaService({required this.apiManager});

  Future<PutMediaResponseEntity> putMultimedia(PutMediaRequest request) async {
    try {
      final response = await apiManager.client().post(
        apiManager.endPoints.mediaUploadEndpoint,
        data: request.toJson(),
      );

      return PutMediaResponseEntity.fromJson(response.data);
    } on DioException catch (e) {
      return PutMediaResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
