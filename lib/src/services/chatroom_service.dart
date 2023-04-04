// getChatroom(GetChatroomRequest, GetChatroomResponse? -> unit)

// Call chatroom with GET method and with chatroomID received in GetChatroomRequest, api_type=1 (API type is 1 for SDK in specific APIs) and x-version-code=v2 in headers to fetch chatroom

// If chatroom success==false

// return getChatroomResponse: {success: false, errorMessage: <returned in chatroom}

// else

// return getChatroomResponse: {success: true, chatroom: <chatroom:{} received in chatroom>, chatroomActions: <chatroom_actions:{} received in chatroom>}

// followChatroom(FollowChatroomRequest, FollowChatroomResponse? -> unit)

// Call chatroom/follow with PUT method and with chatroomID, value received in FollowChatroomRequest to follow chatroom

// If chatroom/follow success==false

// return followChatroomResponse: {success: false, errorMessage: <returned in chatroom/follow}

// else

// return followChatroomResponse: {success: true}

// muteChatroom(MuteChatroomRequest, MuteChatroomResponse? -> unit)

// Call chatroom/mute with PUT method and with chatroomID, value received in MuteChatroomRequest to mute chatroom

// If chatroom/mute success==false

// return muteChatroomResponse: {success: false, errorMessage: <returned in chatroom/mute}

// else

// return muteChatroomResponse: {success: true}

// markReadChatroom(MarkReadChatroomRequest,MarkReadChatroomResponse? -> Unit)

// Call chatroom/mark_read with POST method and with chatroomId received in MarkReadChatroomRequest to mark chatroom as read

// If chatroom/mark_read success==false

// return markReadChatroomResponse:{success: false, errorMessage:<returned in chatroom/mark_read>}

// else

// return markReadChatroomResponse:{success: true}

// shareChatroomUrl(ShareChatroomUrlRequest,ShareChatroomUrlResponse? -> Unit)

// Call chatroom/share with GET method and with chatroomId and domain received in ShareChatroomUrlRequest to get share url of chatroom

// If chatroom/share success==false

// return shareChatroomUrlResponse:{success: false, errorMessage:<returned in chatroom/share>}

// else

// return shareChatroomUrlResponse:{success: true, chatroomShare:<chatroom_share:{} received in chatroom/share>}

// setChatroomTopic(SetChatroomTopicRequest, SetChatroomTopicResponse? -> Unit)

// Call conversation/topic with PUT method and with chatroomId and conversationId received in SetChatroomTopicRequest to set a message as chatroom topic

// If conversation/topic success==false

// return setChatroomTopicResponse:{success: false, errorMessage: <returned in conversation/topic>}

// else

// return setChatroomTopicResponse:{success: true}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IChatroomService {
  Future<GetChatroomResponseEntity> getChatroom(GetChatroomRequest request);
  Future<FollowChatroomResponse> followChatroom(FollowChatroomRequest request);
  Future<MuteChatroomResponse> muteChatroom(MuteChatroomRequest request);
  Future<MarkReadChatroomResponse> markReadChatroom(
      MarkReadChatroomRequest request);
  // Future<ShareChatroomUrlResponse> shareChatroomUrl(ShareChatroomUrlRequest request);
  // Future<SetChatroomTopicResponse> setChatroomTopic(SetChatroomTopicRequest request);
}

class ChatroomService extends IChatroomService {
  final ApiManager apiManager;

  ChatroomService({required this.apiManager});

  @override
  Future<GetChatroomResponseEntity> getChatroom(
      GetChatroomRequest request) async {
    try {
      final ressponse = await apiManager.get(
        apiManager.endPoints.chatroomEndpoint,
        queryParameters: request.toJson(),
        options: Options(
          headers: {
            'api_type': '1',
            'x-version-code': 'v2',
          },
        ),
      );
      return GetChatroomResponseEntity.fromJson(ressponse.data);
    } on DioError catch (e) {
      debugPrint(e.message);
      return GetChatroomResponseEntity(success: false, errorMessage: e.message);
    }
  }

  @override
  Future<FollowChatroomResponse> followChatroom(
      FollowChatroomRequest request) async {
    try {
      final response = await apiManager.put(
        apiManager.endPoints.chatroomFollowEndpoint,
        queryParameters: request.toJson(),
      );
      return FollowChatroomResponse.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.message);
      return FollowChatroomResponse(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<MarkReadChatroomResponse> markReadChatroom(
      MarkReadChatroomRequest request) async {
    try {
      final response = await apiManager.post(
        apiManager.endPoints.chatroomMarkReadEndpoint,
        data: request.toJson(),
      );
      return MarkReadChatroomResponse.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return MarkReadChatroomResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<MuteChatroomResponse> muteChatroom(MuteChatroomRequest request) async {
    try {
      final response = await apiManager.put(
        apiManager.endPoints.chatroomMuteEndpoint,
        data: request.toJson(),
      );
      return MuteChatroomResponse.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.message);
      return MuteChatroomResponse(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
