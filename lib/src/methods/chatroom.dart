import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/chatroom_repository.dart';

// ignore: lines_longer_than_80_chars
/// ChatroomApi class is responsible for handling all the chatroom related API calls
class ChatroomApi {
  final ChatroomRepository chatroomRepository;

  ChatroomApi({required this.chatroomRepository});

  Future<LMResponse<GetChatroomResponse>> getChatroom(
    GetChatroomRequest request,
  ) async {
    return await chatroomRepository.getChatroom(request);
  }

  Future<LMResponse<void>> followChatroom(
    FollowChatroomRequest request,
  ) async {
    return await chatroomRepository.followChatroom(request);
  }

  Future<LMResponse<void>> muteChatroom(
    MuteChatroomRequest request,
  ) async {
    return await chatroomRepository.muteChatroom(request);
  }

  Future<LMResponse<void>> markReadChatroom(
    MarkReadChatroomRequest request,
  ) async {
    return await chatroomRepository.markReadChatroom(request);
  }

  Future<LMResponse<void>> shareChatroomUrl(
    ShareChatroomRequest request,
  ) async {
    return await chatroomRepository.shareChatroomUrl(request);
  }

  Future<LMResponse<void>> setChatroomTopic(
    SetChatroomTopicRequest request,
  ) async {
    return await chatroomRepository.setChatroomTopic(request);
  }

  Future<LMResponse<void>> deleteParticipant(
    DeleteParticipantRequest request,
  ) async {
    return await chatroomRepository.deleteParticipant(request);
  }
}
