import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/user/schema/user_schema.dart';
import 'package:likeminds_chat_fl/src/persistence/user/utils/utils.dart';

// This class handles all the DB operations
// related to User Data
// Accepts box names as strings
class LMChatUserDBHandler {
  final String userBoxName;
  final String memberStateBoxName;
  late Box<LMChatUserSchema> userBox;
  late Box<LMChatMemberStateSchema> memberStateBox;

  LMChatUserDBHandler({
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
      final userSchema = user.toUserSchema();
      await userBox.put(userSchema.uuid, userSchema);
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
      final userSchemas = userBox.values.toList();

      if (userSchemas.isEmpty) {
        return LMResponse(success: false, errorMessage: "User not found");
      }
      final user = userSchemas.first.toUser();
      return LMResponse(success: true, data: user);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // CRUD operation for MemberStateResponse Model
  // Get [MemberStateResponse] data from local DB
  LMResponse<MemberStateResponse> getMemberState() {
    try {
      final memberStateSchemas = memberStateBox.values.toList();

      if (memberStateSchemas.isEmpty) {
        return LMResponse(
            success: false, errorMessage: "MemberState not found");
      }
      final memberStateResponse = memberStateSchemas.first.toMemberState();
      return LMResponse(success: true, data: memberStateResponse);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Update [MemberStateResponse] data in local DB
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    try {
      final memberStateSchema = memberStateResponse.toMemberStateSchema();
      await memberStateBox.put(memberStateSchema.uuid, memberStateSchema);
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
