import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/participants.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/chatroom_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/helper_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/home_feed_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/media_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/participants_repository.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';
import 'package:likeminds_chat_fl/src/services/chatroom_service.dart';
import 'package:likeminds_chat_fl/src/services/conversation_service.dart';
import 'package:likeminds_chat_fl/src/services/helper_service.dart';
import 'package:likeminds_chat_fl/src/services/home_feed_service.dart';
import 'package:likeminds_chat_fl/src/services/media_service.dart';
import 'package:likeminds_chat_fl/src/services/notification_service.dart';
import 'package:likeminds_chat_fl/src/services/participants_service.dart';

/// Dependency Injection Service
/// This class is responsible for registering all the dependencies
/// and providing the instances of the dependencies
/// This class is a singleton class
class DIService {
  static DIService? _instance;
  static DIService get instance => _instance ??= DIService._();

  late final bool production;
  set _setProduction(bool isProduction) => production = isProduction;
  get isProduction => instance.production;

  DIService._();

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(String apiKey, bool isProduction, LMSdkCallback sdkCallback) {
    _setProduction = isProduction;
    final TokenManager tokenManager = TokenManager();
    tokenManager.setApiKey(apiKey);

    ApiManager apiManager = ApiManager(
      tokenManager: tokenManager,
      production: isProduction,
    );

    /// Register all the services in the getIt instance
    getIt.registerLazySingleton(
      () => sdkCallback,
      instanceName: "LMCallback",
    );
    getIt.registerLazySingleton(
      () => NotificationService(
        apiClient: apiManager,
      ),
    );

    AuthService authService = AuthService(apiManager: apiManager);
    AuthRepository authRepository = AuthRepository(authService: authService);

    HomeFeedService homeFeedService = HomeFeedService(apiManager: apiManager);
    HomeFeedRepository homeFeedRepository =
        HomeFeedRepository(homeFeedService: homeFeedService);

    ChatroomService chatroomService = ChatroomService(apiManager: apiManager);
    ChatroomRepository chatroomRepository =
        ChatroomRepository(chatroomService: chatroomService);

    ConversationService conversationService =
        ConversationService(apiManager: apiManager);
    ConversationRepository conversationRepository =
        ConversationRepository(conversationService: conversationService);

    MediaService mediaService = MediaService(apiManager: apiManager);
    MediaRepository mediaRepository =
        MediaRepository(mediaService: mediaService);

    ParticipantsService participantsService =
        ParticipantsService(apiManager: apiManager);
    ParticipantsRepository participantsRepository =
        ParticipantsRepository(participantsService: participantsService);

    HelperService helperService = HelperService(apiClient: apiManager);
    HelperRepository helperRepository =
        HelperRepository(helperService: helperService);

    /// Register all the dependencies in the getIt instance
    getIt.registerFactory<AuthRepository>(
      () => authRepository,
      instanceName: kInstanceAuthRepository,
    );
    getIt.registerFactory<HomeFeedRepository>(
      () => homeFeedRepository,
      instanceName: kInstanceHomeFeedRepository,
    );
    getIt.registerFactory<ChatroomRepository>(
      () => chatroomRepository,
      instanceName: kInstanceChatroomRepository,
    );
    getIt.registerFactory<ConversationRepository>(
      () => conversationRepository,
      instanceName: kInstanceConversationRepository,
    );
    getIt.registerFactory<MediaRepository>(
      () => mediaRepository,
      instanceName: kInstanceMediaRepository,
    );
    getIt.registerFactory<ParticipantsRepository>(
      () => participantsRepository,
      instanceName: kInstanceParticipantsRepository,
    );
    getIt.registerFactory<HelperRepository>(
      () => helperRepository,
      instanceName: kInstanceHelperRepository,
    );
  }

  /// Get the static instance of GetIt to get the dependencies
  static GetIt getIt = GetIt.instance;

  /// Constant instances of the dependencies
  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceHomeFeedRepository = 'home_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstanceChatroomRepository = 'chatroom_repository';
  static const String kInstanceConversationRepository =
      'conversation_repository';
  static const String kInstanceMediaRepository = 'media_repository';
  static const String kInstanceBrandingRepository = 'branding_repository';
  static const String kInstanceHelperRepository = 'helper_repository';
  static const String kInstanceParticipantsRepository =
      'participants_repository';
}
