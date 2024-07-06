import 'package:likeminds_chat_fl/src/methods/access.dart';
import 'package:likeminds_chat_fl/src/methods/auth.dart';
import 'package:likeminds_chat_fl/src/methods/chatroom.dart';
import 'package:likeminds_chat_fl/src/methods/conversation.dart';
import 'package:likeminds_chat_fl/src/methods/dm.dart';
import 'package:likeminds_chat_fl/src/methods/explore.dart';
import 'package:likeminds_chat_fl/src/methods/helper.dart';
import 'package:likeminds_chat_fl/src/methods/home.dart';
import 'package:likeminds_chat_fl/src/methods/media.dart';
import 'package:likeminds_chat_fl/src/methods/moderation.dart';
import 'package:likeminds_chat_fl/src/methods/participants.dart';
import 'package:likeminds_chat_fl/src/methods/persistence.dart';
import 'package:likeminds_chat_fl/src/methods/poll.dart';
import 'package:likeminds_chat_fl/src/methods/reaction.dart';
import 'package:likeminds_chat_fl/src/services/service_provider.dart';

class SDKApplication {
  static SDKApplication? _instance;
  static SDKApplication get instance => _instance ??= SDKApplication._();

  SDKApplication._();

  AuthApi getAuthApi() {
    return AuthApi(
      authRepository: LMChatServiceProvider.instance.authRepository,
    );
  }

  AccessApi getAccessApi() {
    return AccessApi(
      accessRepository: LMChatServiceProvider.instance.accessRepository,
    );
  }

  HomeApi getHomeApi() {
    return HomeApi(
      homeRepository: LMChatServiceProvider.instance.homeFeedRepository,
    );
  }

  ChatroomApi getChatroomApi() {
    return ChatroomApi(
      chatroomRepository: LMChatServiceProvider.instance.chatroomRepository,
    );
  }

  ConversationApi getConversationApi() {
    return ConversationApi(
      conversationRepository:
          LMChatServiceProvider.instance.conversationRepository,
    );
  }

  MediaApi getMediaApi() {
    return MediaApi(
      mediaRepository: LMChatServiceProvider.instance.mediaRepository,
    );
  }

  ParticipantsApi getParticipantsApi() {
    return ParticipantsApi(
      participantsRepository:
          LMChatServiceProvider.instance.participantsRepository,
    );
  }

  HelperApi getHelperApi() {
    return HelperApi(
      helperRepository: LMChatServiceProvider.instance.helperRepository,
    );
  }

  ExploreApi getExploreApi() {
    return ExploreApi(
      exploreRepository: LMChatServiceProvider.instance.exploreRepository,
    );
  }

  ReactionApi getReactionApi() {
    return ReactionApi(
      reactionRepository: LMChatServiceProvider.instance.reactionRepository,
    );
  }

  PollApi getPollApi() {
    return PollApi(
      pollRepository: LMChatServiceProvider.instance.pollRepository,
    );
  }

  DMApi getDMApi() {
    return DMApi(
      dmRepository: LMChatServiceProvider.instance.dmRepository,
    );
  }

  PersistenceApi getPersistenceApi() {
    return PersistenceApi(
      persistenceRepository:
          LMChatServiceProvider.instance.persistenceRepository,
    );
  }

  ModerationApi getModerationApi() {
    return ModerationApi(
      moderationRepository: LMChatServiceProvider.instance.moderationRepository,
    );
  }
}
