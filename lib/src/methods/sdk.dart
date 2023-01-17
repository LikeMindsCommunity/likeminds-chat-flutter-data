import 'package:likeminds_groupchat/src/methods/auth.dart';

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
    // return authApiImpl
    return AuthApi();
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
