import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/chatroom_service.dart';

class ChatroomRepository {
  final ChatroomService chatroomService;

  ChatroomRepository({required this.chatroomService});

  Future<GetChatroomResponse> getChatroom(GetChatroomRequest request) async {
    GetChatroomResponseEntity responseEntity =
        await chatroomService.getChatroom(request);
    return GetChatroomResponse.fromEntity(responseEntity);
  }

  Future<FollowChatroomResponse> followChatroom(
      FollowChatroomRequest request) async {
    FollowChatroomResponse response =
        await chatroomService.followChatroom(request);
    return response;
  }

  Future<MuteChatroomResponse> muteChatroom(MuteChatroomRequest request) async {
    MuteChatroomResponse response = await chatroomService.muteChatroom(request);
    return response;
  }

  Future<MarkReadChatroomResponse> markReadChatroom(
      MarkReadChatroomRequest request) async {
    MarkReadChatroomResponse response =
        await chatroomService.markReadChatroom(request);
    return response;
  }

  Future<ShareChatroomResponse> shareChatroomUrl(
      ShareChatroomRequest request) async {
    ShareChatroomResponse response =
        await chatroomService.shareChatroomUrl(request);
    return response;
  }

  Future<SetChatroomTopicResponse> setChatroomTopic(
      SetChatroomTopicRequest request) async {
    SetChatroomTopicResponse response =
        await chatroomService.setChatroomTopic(request);
    return response;
  }
}
