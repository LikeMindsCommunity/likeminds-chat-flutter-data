import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/reaction_repository.dart';

class ReactionApi {
  final ReactionRepository reactionRepository;

  ReactionApi({required this.reactionRepository});

  Future<LMResponse<void>> putReaction(PutReactionRequest request) async {
    return await reactionRepository.putReaction(request);
  }

  Future<LMResponse<void>> deleteReaction(DeleteReactionRequest request) async {
    return await reactionRepository.deleteReaction(request);
  }
}
