import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/reaction_service.dart';

class ReactionRepository {
  final ReactionService reactionService;

  ReactionRepository({required this.reactionService});

  Future<PutReactionResponse> putReaction(PutReactionRequest request) async {
    PutReactionResponseEntity responseEntity =
        await reactionService.putReaction(request);
    return PutReactionResponse.fromEntity(responseEntity);
  }

  Future<DeleteReactionResponse> deleteReaction(
      DeleteReactionRequest request) async {
    DeleteReactionResponseEntity responseEntity =
        await reactionService.deleteReaction(request);
    return DeleteReactionResponse.fromEntity(responseEntity);
  }
}
