import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/user/schema/user_schema.dart';
import 'package:likeminds_chat_fl/src/persistence/user/utils/utils.dart';

// This class handles all the DB operations
// related to User Data
// Accepts box names as strings
class LMUserDBHandlerHive {
  final String userBoxName;
  final String memberStateBoxName;
  late Box<LMChatUserSchema> userBox;
  late Box<LMChatMemberStateSchema> memberStateBox;

  LMUserDBHandlerHive({
    required this.userBoxName,
    required this.memberStateBoxName,
  });

  Future<LMResponse> initiate() async {
    try {
      Hive.registerAdapter(LMChatMemberRightSchemaAdapter());
      Hive.registerAdapter(LMChatMemberStateSchemaAdapter());
      Hive.registerAdapter(LMChatSDKClientInfoSchemaAdapter());
      Hive.registerAdapter(LMChatUserSchemaAdapter());

      userBox = await Hive.openBox<LMChatUserSchema>(userBoxName);
      memberStateBox =
          await Hive.openBox<LMChatMemberStateSchema>(memberStateBoxName);

      if (userBox.isOpen && memberStateBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: "Failed to open box");
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for User Model
  // Insert [User] data into local DB
  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    try {
      final userHiveModel = user.toUserSchema();
      await userBox.put(userHiveModel.uuid, userHiveModel);
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [User] data from local DB
  Future<LMResponse<void>> deleteUser() async {
    try {
      await userBox.clear();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Get [User] data from local DB
  LMResponse<User> getUser() {
    try {
      final userHiveModels = userBox.values.toList();

      if (userHiveModels.isEmpty) {
        return LMResponse(success: false, errorMessage: "User not found");
      }
      final user = userHiveModels.first.toUser();
      return LMResponse(success: true, data: user);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for MemberStateResponse Model
  // Get [MemberStateResponse] data from local DB
  LMResponse<MemberStateResponse> getMemberState() {
    try {
      final memberStateHiveModels = memberStateBox.values.toList();

      if (memberStateHiveModels.isEmpty) {
        return LMResponse(
            success: false, errorMessage: "MemberState not found");
      }
      final memberStateResponse = memberStateHiveModels.first.toMemberState();
      return LMResponse(success: true, data: memberStateResponse);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Update [MemberStateResponse] data in local DB
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    try {
      final memberStateHiveModel = memberStateResponse.toMemberStateSchema();
      await memberStateBox.put(memberStateHiveModel.uuid, memberStateHiveModel);
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Delete [MemberStateResponse] data from local DB
  Future<LMResponse<void>> deleteMemberState() async {
    try {
      await memberStateBox.clear();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // Close the box
  Future<LMResponse<void>> dispose() async {
    try {
      await userBox.close();
      await memberStateBox.close();
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }
}
