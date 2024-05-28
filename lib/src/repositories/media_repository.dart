import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/media_service.dart';

class MediaRepository {
  final MediaService mediaService;

  MediaRepository({required this.mediaService});

  Future<LMResponse<PutMediaResponse>> putMultimedia(
      PutMediaRequest request) async {
    final response = await mediaService.putMultimedia(request);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: PutMediaResponse.fromEntity(response.data!),
    );
  }
}
