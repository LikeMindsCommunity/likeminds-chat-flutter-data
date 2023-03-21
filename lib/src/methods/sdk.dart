import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/methods/auth.dart';
import 'package:likeminds_chat_fl/src/methods/home.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/repositories/home_feed_repository.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class SdkApplication {
  SdkApplication initialize() {
    return SdkApplication();
  }

  AuthApi getAuthApi() {
    return AuthApi(
      authRepository: GetIt.instance.get<AuthRepository>(
        instanceName: DIService.kInstanceAuthRepository,
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
}
