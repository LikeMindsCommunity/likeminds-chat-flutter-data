import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';

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

  final TokenManager tokenManager = TokenManager();

  DIService._();

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(String apiKey, bool isProduction, LMSdkCallback sdkCallback) {
    _setProduction = isProduction;
    tokenManager.setApiKey(apiKey);

    ApiManager apiManager = ApiManager(
      tokenManager: tokenManager,
    );

    AuthService authService = AuthService(apiManager: apiManager);
    AuthRepository authRepository = AuthRepository(authService: authService);

    /// Register all the services in the getIt instance
    getIt.registerLazySingleton(
      () => sdkCallback,
      instanceName: "LMCallback",
    );

    /// Register all the dependencies in the getIt instance
    getIt.registerFactory<AuthRepository>(
      () => authRepository,
      instanceName: kInstanceAuthRepository,
    );
  }

  /// Get the static instance of GetIt to get the dependencies
  static GetIt getIt = GetIt.instance;

  /// Constant instances of the dependencies
  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceAccessRepository = 'access_repository';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstancePostRepository = 'post_repository';
  static const String kInstanceMediaRepository = 'media_repository';
  static const String kInstanceBrandingRepository = 'branding_repository';
  static const String kInstanceHelperRepository = 'helper_repository';
}
