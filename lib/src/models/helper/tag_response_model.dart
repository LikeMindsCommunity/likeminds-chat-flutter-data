import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'tag_response_model.g.dart';

class TagResponseModel {
  final List<GroupTag>? groupTags;
  final List<UserTag>? members;
  final List<UserTag>? participants;

  TagResponseModel({
    this.groupTags,
    this.members,
    this.participants,
  });

  factory TagResponseModel.fromEntity(TagResponseModelEntity entity) {
    return TagResponseModel(
      groupTags: entity.groupTags?.map((e) => GroupTag.fromEntity(e)).toList(),
      members: entity.members?.map((e) => UserTag.fromEntity(e)).toList(),
      participants:
          entity.participants?.map((e) => UserTag.fromEntity(e)).toList(),
    );
  }

  TagResponseModelEntity toEntity() {
    return TagResponseModelEntity(
      groupTags: groupTags?.map((e) => e.toEntity()).toList(),
      members: members?.map((e) => e.toEntity()).toList(),
      participants: participants?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class TagResponseModelEntity {

  @JsonKey(name: 'group_tags')
  final List<GroupTagEntity>? groupTags;

  @JsonKey(name: 'community_members')
  final List<UserTagEntity>? members;

  @JsonKey(name: 'chatroom_participants')
  final List<UserTagEntity>? participants;

  TagResponseModelEntity({
    this.groupTags,
    this.members,
    this.participants,
  });

  factory TagResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      _$TagResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TagResponseModelEntityToJson(this);
}
