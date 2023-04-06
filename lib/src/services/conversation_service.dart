// getConversation(GetConversationRequest, GetConversationResponse? -> unit)

// Server

// (Deprecated) Call conversation with GET method and with chatroomID, conversationID, scrollDirection, paginateBy, topNavigate, include received in GetConversationRequest to get conversations

// Call conversation/sync follow: Sync Revamp - Client | Server Only.1

// Local DB

// To start syncing. Ref: Sync Revamp - Client | Local db.1

// Local DB

// Write query to get conversation - conversations-[]

// If sync fails or conversation/sync success==false

// return getConversationResponse: {success: false, errorMessage: <returned in conversation}

// else

// return getConversationResponse: {success: true, LMResponse<GetConversationResponse>}

// postConversation(PostConversationRequest, PostConversationResponse? -> unit)

// Call conversation with POST method and with chatroomID, hasFiles, attachmentCount, repliedConversationID, shareLink, ogTags being received in PostConversationRequest

// If conversation success==false

// return postConversationResponse: {success: false, errorMessage: <returned in conversation}

// else

// return postConversationResponse: {success: true, LMResponse<PostConversationResponse>}

// Refs:

// Reply: Chat room message actions | Swipe to reply

// Link Sharing: Link Sharing

// Attachment: Multimedia - Image + Video + PDF + Gif + Audio + Voice Note

// editConversation(EditConversationRequest, EditConversationResponse? -> unit)

// Call conversation with PUT method and with conversationID, text, shareLink, ogTagsI received in EditConversationRequest to edit conversation

// If conversation success==false

// return editConversationResponse: {success: false, errorMessage: <returned in conversation}

// else

// return editConversationResponse: {success: true, LMResponse<EditConversationResponse>}

// Refs: Chat room message actions | Edit Conversation:

// deleteConversation(DeleteConversationRequest, DeleteConversationResponse? -> unit)

// Call conversation with DELETE method and with conversationIDs, reason received in DeleteConversationRequest to delete conversations

// If conversation success==false

// return deleteConversationResponse: {success: false, errorMessage: <returned in conversation}

// else

// return deleteConversationResponse: {success: true}

// Refs: Chat room message actions | Delete Conversation:

import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IConversationService {
  Future<GetConversationResponseEntity> getConversation(
      GetConversationRequest request);
  Future<PostConversationResponseEntity> postConversation(
      PostConversationRequest request);
  Future<EditConversationResponseEntity> editConversation(
      EditConversationRequest request);
  Future<DeleteConversationResponseEntity> deleteConversation(
      DeleteConversationRequest request);
}

class ConversationService extends IConversationService {
  final ApiManager _apiManager;

  ConversationService({required ApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<GetConversationResponseEntity> getConversation(
      GetConversationRequest request) async {
    try {
      final response = await _apiManager.get(
        _apiManager.endPoints.conversationSyncEndpoint,
        queryParameters: request.toJson(),
      );

      return GetConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return GetConversationResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<PostConversationResponseEntity> postConversation(
      PostConversationRequest request) async {
    try {
      final response = await _apiManager.post(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return PostConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return PostConversationResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<EditConversationResponseEntity> editConversation(
      EditConversationRequest request) async {
    try {
      final response = await _apiManager.put(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return EditConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return EditConversationResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<DeleteConversationResponseEntity> deleteConversation(
      DeleteConversationRequest request) async {
    try {
      final response = await _apiManager.delete(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return DeleteConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return DeleteConversationResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
