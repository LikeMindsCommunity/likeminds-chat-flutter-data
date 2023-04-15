import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/media_service.dart';

class MediaRepository {
  final MediaService mediaService;

  MediaRepository({required this.mediaService});

  Future<PutMediaResponse> putMultimedia(PutMediaRequest request) async {
    final response = await mediaService.putMultimedia(request);
    return PutMediaResponse.fromEntity(response);
  }
}
