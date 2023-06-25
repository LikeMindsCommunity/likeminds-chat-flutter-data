import 'package:envied/envied.dart';

part 'test_env.g.dart';

@Envied(path: 'test/.env.test')
abstract class EnvTest {
  @EnviedField(varName: 'TESTING_BETA_API_KEY', obfuscate: true)
  static final String testingBetaAPIKey = _EnvTest.testingBetaAPIKey;
  @EnviedField(varName: 'TESTING_BETA_BOT_ID', obfuscate: true)
  static final String testingBetaBotID = _EnvTest.testingBetaBotID;
  @EnviedField(varName: 'TESTING_BETA_DEFAULT_CHATROOM', obfuscate: false)
  static const int testingBetaDefaultChatroom =
      _EnvTest.testingBetaDefaultChatroom;
  @EnviedField(varName: 'TESTING_PROD_API_KEY', obfuscate: true)
  static final String testingProdAPIKey = _EnvTest.testingProdAPIKey;
  @EnviedField(varName: 'TESTING_PROD_BOT_ID', obfuscate: true)
  static final String testingProdBotID = _EnvTest.testingProdBotID;
  @EnviedField(varName: 'TESTING_PROD_DEFAULT_CHATROOM', obfuscate: false)
  static const int testingProdDefaultChatroom =
      _EnvTest.testingProdDefaultChatroom;
}
