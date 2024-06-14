import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/methods/access.dart';
import 'package:likeminds_chat_fl/src/methods/auth.dart';
import 'package:likeminds_chat_fl/src/methods/chatroom.dart';
import 'package:likeminds_chat_fl/src/methods/conversation.dart';
import 'package:likeminds_chat_fl/src/methods/dm.dart';
import 'package:likeminds_chat_fl/src/methods/explore.dart';
import 'package:likeminds_chat_fl/src/methods/helper.dart';
import 'package:likeminds_chat_fl/src/methods/home.dart';
import 'package:likeminds_chat_fl/src/methods/media.dart';
import 'package:likeminds_chat_fl/src/methods/participants.dart';
import 'package:likeminds_chat_fl/src/methods/persistence.dart';
import 'package:likeminds_chat_fl/src/methods/poll.dart';
import 'package:likeminds_chat_fl/src/methods/reaction.dart';
import 'package:likeminds_chat_fl/src/repositories/access_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/chatroom_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/dm_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/explore_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/helper_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/home_feed_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/media_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/participants_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/persistence_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/poll_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/reaction_repository.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class SDKApplication {
  SDKApplication initialize() {
    return SDKApplication();
  }

  AuthApi getAuthApi() {
    return AuthApi(
      authRepository: GetIt.instance.get<AuthRepository>(
        instanceName: DIService.kInstanceAuthRepository,
      ),
    );
  }

  AccessApi getAccessApi() {
    return AccessApi(
      accessRepository: GetIt.instance.get<AccessRepository>(
        instanceName: DIService.kInstanceAccessRepository,
      ),
    );
  }

  HomeApi getHomeApi() {
    return HomeApi(
      homeRepository: GetIt.instance.get<HomeFeedRepository>(
        instanceName: DIService.kInstanceHomeFeedRepository,
      ),
    );
  }

  ChatroomApi getChatroomApi() {
    return ChatroomApi(
      chatroomRepository: GetIt.instance.get<ChatroomRepository>(
        instanceName: DIService.kInstanceChatroomRepository,
      ),
    );
  }

  ConversationApi getConversationApi() {
    return ConversationApi(
      conversationRepository: GetIt.instance.get<ConversationRepository>(
        instanceName: DIService.kInstanceConversationRepository,
      ),
    );
  }

  MediaApi getMediaApi() {
    return MediaApi(
      mediaRepository: GetIt.instance.get<MediaRepository>(
        instanceName: DIService.kInstanceMediaRepository,
      ),
    );
  }

  ParticipantsApi getParticipantsApi() {
    return ParticipantsApi(
      participantsRepository: GetIt.instance.get<ParticipantsRepository>(
        instanceName: DIService.kInstanceParticipantsRepository,
      ),
    );
  }

  HelperApi getHelperApi() {
    return HelperApi(
      helperRepository: GetIt.instance.get<HelperRepository>(
        instanceName: DIService.kInstanceHelperRepository,
      ),
    );
  }

  ExploreApi getExploreApi() {
    return ExploreApi(
      exploreRepository: GetIt.instance.get<ExploreRepository>(
        instanceName: DIService.kInstanceExploreRepository,
      ),
    );
  }

  ReactionApi getReactionApi() {
    return ReactionApi(
      reactionRepository: GetIt.instance.get<ReactionRepository>(
        instanceName: DIService.kInstanceReactionRepository,
      ),
    );
  }

  PollApi getPollApi() {
    return PollApi(
      pollRepository: GetIt.instance.get<PollRepository>(
        instanceName: DIService.kInstancePollRepository,
      ),
    );
  }

  DMApi getDMApi() {
    return DMApi(
      dmRepository: GetIt.instance.get<DMRepository>(
        instanceName: DIService.kInstanceDMRepository,
      ),
    );
  }
  
  PersistenceApi getPersistenceApi() {
    return PersistenceApi(
      persistenceRepository: GetIt.instance.get<PersistenceRepository>(
        instanceName: DIService.kInstancePersistenceRepository,
      ),
    );
  }
}
