import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'poll_option_model.g.dart';

class PollOption {
  final String? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final String? subText;
  final int? noVotes;
  final User? member;
  final String? userId;

  PollOption({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.subText,
    this.noVotes,
    this.member,
    this.userId,
  });

  factory PollOption.fromEntity(PollOptionEntity entity) {
    return PollOption(
      id: entity.id,
      text: entity.text,
      isSelected: entity.isSelected,
      percentage: entity.percentage,
      subText: entity.subText,
      noVotes: entity.noVotes,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      userId: entity.userId,
    );
  }

  PollOptionEntity toEntity() {
    return PollOptionEntity(
      id: id,
      text: text,
      isSelected: isSelected,
      percentage: percentage,
      subText: subText,
      noVotes: noVotes,
      member: member != null ? member!.toEntity() : null,
      userId: userId,
    );
  }
}

@JsonSerializable()
class PollOptionEntity {
  final String? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final String? subText;
  final int? noVotes;
  final UserEntity? member;
  final String? userId;

  PollOptionEntity({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.subText,
    this.noVotes,
    this.member,
    this.userId,
  });

  factory PollOptionEntity.fromJson(Map<String, dynamic> json) =>
      _$PollOptionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PollOptionEntityToJson(this);
}
