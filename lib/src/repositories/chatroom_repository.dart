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
}
