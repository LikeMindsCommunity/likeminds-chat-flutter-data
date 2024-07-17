import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/repositories/access_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/chatroom_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/dm_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/explore_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/helper_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/home_feed_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/media_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/moderation_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/participants_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/persistence_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/poll_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/reaction_repository.dart';
import 'package:likeminds_chat_fl/src/services/access_service.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';
import 'package:likeminds_chat_fl/src/services/chatroom_service.dart';
import 'package:likeminds_chat_fl/src/services/conversation_service.dart';
import 'package:likeminds_chat_fl/src/services/dm_service.dart';
import 'package:likeminds_chat_fl/src/services/explore_service.dart';
import 'package:likeminds_chat_fl/src/services/helper_service.dart';
import 'package:likeminds_chat_fl/src/services/home_feed_service.dart';
import 'package:likeminds_chat_fl/src/services/media_service.dart';
import 'package:likeminds_chat_fl/src/services/moderation_service.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';
import 'package:likeminds_chat_fl/src/services/participants_service.dart';
import 'package:likeminds_chat_fl/src/services/persistance_service.dart';
import 'package:likeminds_chat_fl/src/services/poll_service.dart';
import 'package:likeminds_chat_fl/src/services/reaction_service.dart';

/// [LMChatServiceProvider] is a provider class to register all the dependencies
/// This class is a singleton class
/// This class should be used to register all the dependencies
/// This class should be used to get all the instances of
/// the dependencies of Service and Repository
/// This class should be used to get the callback instance
class LMChatServiceProvider {
  static LMChatServiceProvider? _instance;
  static LMChatServiceProvider get instance =>
      _instance ??= LMChatServiceProvider._();

  late final bool production;
  set _setProduction(bool isProduction) => production = isProduction;
  get isProduction => instance.production;

  LMChatServiceProvider._();

  // Instance for all the services
  late final AuthService authService;
  late final AccessService accessService;
  late final HomeFeedService homeFeedService;
  late final ChatroomService chatroomService;
  late final ConversationService conversationService;
  late final MediaService mediaService;
  late final ParticipantsService participantsService;
  late final HelperService helperService;
  late final ExploreService exploreService;
  late final ReactionService reactionService;
  late final PollService pollService;
  late final DMService dmService;
  late final PersistenceService persistenceService;
  late final ModerationService moderationService;

  // Instance for all the repositories
  late final AuthRepository authRepository;
  late final AccessRepository accessRepository;
  late final HomeFeedRepository homeFeedRepository;
  late final ChatroomRepository chatroomRepository;
  late final ConversationRepository conversationRepository;
  late final MediaRepository mediaRepository;
  late final ParticipantsRepository participantsRepository;
  late final HelperRepository helperRepository;
  late final ExploreRepository exploreRepository;
  late final ReactionRepository reactionRepository;
  late final PollRepository pollRepository;
  late final DMRepository dmRepository;
  late final PersistenceRepository persistenceRepository;
  late final ModerationRepository moderationRepository;
  late final NotificationService notificationService;

  // Callback instance
  late final LMChatSDKCallback sdkCallback;

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(bool isProduction, LMChatSDKCallback sdkCallback) {
    _setProduction = isProduction;

    this.sdkCallback = sdkCallback;

    ApiManager apiManager = ApiManager(
      production: production,
    );

    authService = AuthService(apiManager: apiManager);
    authRepository = AuthRepository(authService: authService);

    accessService = AccessService(apiManager: apiManager);
    accessRepository = AccessRepository(accessService: accessService);

    homeFeedService = HomeFeedService(apiManager: apiManager);
    homeFeedRepository = HomeFeedRepository(homeFeedService: homeFeedService);

    chatroomService = ChatroomService(apiManager: apiManager);
    chatroomRepository = ChatroomRepository(chatroomService: chatroomService);

    conversationService = ConversationService(apiManager: apiManager);
    conversationRepository =
        ConversationRepository(conversationService: conversationService);

    mediaService = MediaService(apiManager: apiManager);
    mediaRepository = MediaRepository(mediaService: mediaService);

    participantsService = ParticipantsService(apiManager: apiManager);
    participantsRepository =
        ParticipantsRepository(participantsService: participantsService);

    helperService = HelperService(apiClient: apiManager);
    helperRepository = HelperRepository(helperService: helperService);

    exploreService = ExploreService(apiManager: apiManager);
    exploreRepository = ExploreRepository(exploreService: exploreService);

    reactionService = ReactionService(apiManager: apiManager);
    reactionRepository = ReactionRepository(reactionService: reactionService);

    pollService = PollService(apiManager: apiManager);
    pollRepository = PollRepository(pollService: pollService);

    dmService = DMService(apiManager: apiManager);
    dmRepository = DMRepository(dmService: dmService);
    persistenceService = PersistenceService();
    persistenceRepository =
        PersistenceRepository(persistenceService: persistenceService);
    notificationService = NotificationService(apiManager: apiManager);
    moderationService = ModerationService(apiManager: apiManager);
    moderationRepository =
        ModerationRepository(moderationService: moderationService);
  }
}
