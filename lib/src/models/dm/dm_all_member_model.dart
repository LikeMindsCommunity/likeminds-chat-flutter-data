import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/sdk/sdk_client_info_model.dart';
part 'dm_all_member_model.g.dart';

class DmAllMember {
  final String? customTitle;
  final int? id;
  final String? imageUrl;
  final bool? isDeleted;
  final bool? isGuest;
  final String? name;
  final String? questionAnswers;
  final SDKClientInfo? sdkClientInfo;
  final String? userUniqueId;
  final String? uuid;

  DmAllMember(
      {this.customTitle,
      this.id,
      this.imageUrl,
      this.isDeleted,
      this.isGuest,
      this.name,
      this.questionAnswers,
      this.sdkClientInfo,
      this.userUniqueId,
      this.uuid});

  factory DmAllMember.fromEntity(DmAllMemberEntity entity) {
    return DmAllMember(
      customTitle: entity.customTitle,
      id: entity.id,
      imageUrl: entity.imageUrl,
      isDeleted: entity.isDeleted,
      isGuest: entity.isGuest,
      name: entity.name,
      questionAnswers: entity.questionAnswers,
      sdkClientInfo: entity.sdkClientInfo,
      userUniqueId: entity.userUniqueId,
      uuid: entity.uuid,
    );
  }

  DmAllMemberEntity toEntity() {
    return DmAllMemberEntity(
        customTitle: customTitle,
        id: id,
        imageUrl: imageUrl,
        isDeleted: isDeleted,
        isGuest: isGuest,
        name: name,
        questionAnswers: questionAnswers,
        sdkClientInfo: sdkClientInfo,
        userUniqueId: userUniqueId,
        uuid: uuid);
  }
}

@JsonSerializable()
class DmAllMemberEntity {
  @JsonKey(name: "custom_title")
  final String? customTitle;
  final int? id;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "is_deleted")
  final bool? isDeleted;
  @JsonKey(name: "is_guest")
  final bool? isGuest;
  final String? name;
  @JsonKey(name: "question_answers")
  final String? questionAnswers;
  @JsonKey(name: "sdk_client_info")
  final SDKClientInfo? sdkClientInfo;
  @JsonKey(name: "user_unique_id")
  final String? userUniqueId;
  final String? uuid;

  DmAllMemberEntity({
    this.customTitle,
    this.id,
    this.imageUrl,
    this.isDeleted,
    this.isGuest,
    this.name,
    this.questionAnswers,
    this.sdkClientInfo,
    this.userUniqueId,
    this.uuid,
  });

  factory DmAllMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$DmAllMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DmAllMemberEntityToJson(this);
}
