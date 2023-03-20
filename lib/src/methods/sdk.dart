import 'package:get_it/get_it.dart';
import 'package:likeminds_chat_fl/src/methods/auth.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class SdkApplication {
  SdkApplication initialize() {
    return SdkApplication();
  }

  void _initDb() {}

  void getCommunityApi() {
    // return communityApiImpl;
  }

  void getSearchApi() {
    // return searchApiImpl
  }

  void getCategoryApi() {
    // return categoryApiImpl
  }

  void getCreateCommunityApi() {
    // return createCommunityApiImpl
  }

  AuthApi getAuthApi() {
    return AuthApi(
      authRepository: GetIt.instance.get<AuthRepository>(
        instanceName: DIService.kInstanceAuthRepository,
      ),
    );
  }

  void getProfileApi() {
    // return profileApiImpl
  }

  void getConversationSyncApi() {
    // return conversationSyncApiImpl
  }

  void getChatroomSyncApi() {
    // return chatroomSyncApiImpl
  }

  void getCommunitySyncApi() {
    // return communitySyncApiImpl
  }

  void getMemberSyncApi() {
    // return memberSyncApiImpl
  }

  void getCollabcardApi() {
    // return createCollabcardApiImpl
  }

  void getConfigApi() {
    // return configApiImpl
  }

  void getFileApi() {
    // return fileApiImpl
  }

  void getAccountApi() {
    // return accountApiImpl
  }

  void getSendFeedbackApi() {
    // return sendFeedbackApiImpl
  }

  void getMemberApi() {
    // return memberApiImpl
  }

  void getSubscriptionApi() {
    // return subscriptionApiImpl
  }

  void getChatroomDb() {
    // return chatroomDbImpl
  }

  void getCommunityDb() {
    // return communityDbImpl
  }

  void getMemberDb() {
    // return memberDbImpl
  }

  void getFileReceiverInstance() {
    // return fileReceiver
  }

  void getLoginPreference() {
    // return loginPreferences
  }

  // void isLeakCanaryEnabled() = loginPreferences.isLeakCanaryEnabled()

  // private fun initSegment() {
  //     LMAnalytics.initialize(application)
  // }
}
