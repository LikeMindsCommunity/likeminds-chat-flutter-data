import 'package:likeminds_chat_fl/src/models/models.dart';

class PollOption {
  int? id;
  final String text;
  bool? isSelected;
  int? percentage;
  int? noVotes;
  final User? member;
  int? userId;
  int? count;

  PollOption({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.noVotes,
    this.member,
    this.userId,
    this.count,
  });

  factory PollOption.fromEntity(PollOptionEntity entity) {
    return PollOption(
      id: entity.id,
      text: entity.text,
      isSelected: entity.isSelected,
      percentage: entity.percentage,
      noVotes: entity.noVotes,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      count: entity.count,
    );
  }

  PollOptionEntity toEntity() {
    return PollOptionEntity(
      id: id,
      text: text,
      isSelected: isSelected,
      percentage: percentage,
      noVotes: noVotes,
      member: member?.toEntity(),
      count: count,
    );
  }
}

class PollOptionEntity {
  final int? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final int? noVotes;
  final int? count;
  final UserEntity? member;
  final int? userId;

  PollOptionEntity({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.count,
    this.noVotes,
    this.member,
    this.userId,
  });

  factory PollOptionEntity.fromJson(Map<String, dynamic> json) {
    return PollOptionEntity(
      id: json['id'],
      text: json['text'],
      isSelected: json['is_selected'],
      percentage: json['percentage'],
      noVotes: json['no_votes'],
      count: json['count'],
      userId: json['user_id'],
      member: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'text': text,
      'is_selected': isSelected,
      'percentage': percentage,
      'no_votes': noVotes,
      'count': count,
      'user_id': userId,
      'member': member?.toJson(),
    };

    return data;
  }
}
