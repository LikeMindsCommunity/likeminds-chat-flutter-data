import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/reaction_repository.dart';

class ReactionApi {
  final ReactionRepository reactionRepository;

  ReactionApi({required this.reactionRepository});

  Future<LMResponse<PutReactionResponse>> putReaction(
      PutReactionRequest request) async {
    PutReactionResponse response =
        await reactionRepository.putReaction(request);
    return LMResponse<PutReactionResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<DeleteReactionResponse>> deleteReaction(
      DeleteReactionRequest request) async {
    DeleteReactionResponse response =
        await reactionRepository.deleteReaction(request);
    return LMResponse<DeleteReactionResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }
}
