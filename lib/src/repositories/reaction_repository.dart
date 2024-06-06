import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/reaction_service.dart';

class ReactionRepository {
  final ReactionService reactionService;

  ReactionRepository({required this.reactionService});

  Future<LMResponse<void>> putReaction(PutReactionRequest request) async {
    return await reactionService.putReaction(request);
  }

  Future<LMResponse<void>> deleteReaction(DeleteReactionRequest request) async {
    return await reactionService.deleteReaction(request);
  }
}
