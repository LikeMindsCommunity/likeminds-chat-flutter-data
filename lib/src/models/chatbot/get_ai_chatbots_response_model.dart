import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_ai_chatbots_response_model.g.dart';

class GetAIChatbotsResponse {
  final int page;
  final int totalPages;
  final int totalChatbots;
  final List<User> users;

  GetAIChatbotsResponse({
    required this.page,
    required this.totalPages,
    required this.totalChatbots,
    required this.users,
  });

  factory GetAIChatbotsResponse.fromEntity(GetAIChatbotsResponseEntity entity) {
    return GetAIChatbotsResponse(
      page: entity.page,
      totalPages: entity.totalPages,
      totalChatbots: entity.totalChatbots,
      users: entity.users.map((e) => User.fromEntity(e)).toList(),
    );
  }

  GetAIChatbotsResponseEntity toEntity() {
    return GetAIChatbotsResponseEntity(
      page: page,
      totalPages: totalPages,
      totalChatbots: totalChatbots,
      users: users.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetAIChatbotsResponseEntity {
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_chatbots')
  final int totalChatbots;
  final List<UserEntity> users;

  GetAIChatbotsResponseEntity({
    required this.page,
    required this.totalPages,
    required this.totalChatbots,
    required this.users,
  });

  factory GetAIChatbotsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAIChatbotsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAIChatbotsResponseEntityToJson(this);
}
