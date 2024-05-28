import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/media_repository.dart';

class MediaApi {
  final MediaRepository mediaRepository;

  MediaApi({required this.mediaRepository});

  Future<LMResponse<PutMediaResponse>> putMultimedia(
      PutMediaRequest request) async {
    return await mediaRepository.putMultimedia(request);
  }
}
