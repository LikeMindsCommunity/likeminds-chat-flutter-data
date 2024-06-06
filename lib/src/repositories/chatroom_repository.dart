import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/chatroom_service.dart';

class ChatroomRepository {
  final ChatroomService chatroomService;

  ChatroomRepository({required this.chatroomService});

  Future<LMResponse<GetChatroomResponse>> getChatroom(
      GetChatroomRequest request) async {
    LMResponse<GetChatroomResponseEntity> responseEntity =
        await chatroomService.getChatroom(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetChatroomResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }

  Future<LMResponse<void>> followChatroom(FollowChatroomRequest request) async {
    LMResponse<void> response = await chatroomService.followChatroom(request);
    return response;
  }

  Future<LMResponse<void>> muteChatroom(MuteChatroomRequest request) async {
    LMResponse<void> response = await chatroomService.muteChatroom(request);
    return response;
  }

  Future<LMResponse<void>> markReadChatroom(
      MarkReadChatroomRequest request) async {
    LMResponse<void> response = await chatroomService.markReadChatroom(request);
    return response;
  }

  Future<LMResponse<void>> shareChatroomUrl(
      ShareChatroomRequest request) async {
    LMResponse<void> response = await chatroomService.shareChatroomUrl(request);
    return response;
  }

  Future<LMResponse<void>> setChatroomTopic(
      SetChatroomTopicRequest request) async {
    LMResponse<void> response = await chatroomService.setChatroomTopic(request);
    return response;
  }

  Future<LMResponse<void>> deleteParticipant(
      DeleteParticipantRequest request) async {
    LMResponse<void> response =
        await chatroomService.deleteParticipant(request);
    return response;
  }
}
