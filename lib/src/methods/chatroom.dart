import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/chatroom_repository.dart';

class ChatroomApi {
  final ChatroomRepository chatroomRepository;

  ChatroomApi({required this.chatroomRepository});

  Future<LMResponse<GetChatroomResponse>> getChatroom(
    GetChatroomRequest request,
  ) async {
    GetChatroomResponse response =
        await chatroomRepository.getChatroom(request);
    return LMResponse<GetChatroomResponse>(
      success: response.success,
      data: response,
      errorMessage: response.errorMessage,
    );
  }

  Future<LMResponse<FollowChatroomResponse>> followChatroom(
    FollowChatroomRequest request,
  ) async {
    FollowChatroomResponse response =
        await chatroomRepository.followChatroom(request);
    return LMResponse<FollowChatroomResponse>(
      success: response.success,
      data: response,
      errorMessage: response.errorMessage,
    );
  }
}
