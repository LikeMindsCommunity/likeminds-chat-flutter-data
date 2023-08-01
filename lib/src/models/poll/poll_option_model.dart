class PollOption {
  final String? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final String? subText;
  final int? noVotes;
  final String? userId;
  final int? conversationId;
  final int? count;

  PollOption({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.subText,
    this.noVotes,
    this.userId,
    this.conversationId,
    this.count,
  });

  factory PollOption.fromEntity(PollOptionEntity entity) {
    return PollOption(
      id: entity.id,
      text: entity.text,
      isSelected: entity.isSelected,
      percentage: entity.percentage,
      subText: entity.subText,
      noVotes: entity.noVotes,
      userId: entity.userId,
      conversationId: entity.conversationId,
      count: entity.count,
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
      userId: userId,
      conversationId: conversationId,
      count: count,
    );
  }
}

class PollOptionEntity {
  final String? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final String? subText;
  final int? noVotes;
  final String? userId;
  final int? count;
  final int? conversationId;

  PollOptionEntity({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.subText,
    this.noVotes,
    this.userId,
    this.conversationId,
    this.count,
  });

  factory PollOptionEntity.fromJson(Map<String, dynamic> json) {
    return PollOptionEntity(
      id: json['id'] as String?,
      text: json['text'] as String,
      isSelected: json['is_selected'] as bool?,
      percentage: json['percentage'] as int?,
      subText: json['sub_text'] as String?,
      noVotes: json['no_votes'] as int?,
      userId: json['user_id'] as String?,
      conversationId: json['conversation_id'] as int?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'is_selected': isSelected,
      'percentage': percentage,
      'sub_text': subText,
      'no_votes': noVotes,
      'user_id': userId,
      'conversation_id': conversationId,
      'count': count,
    };
  }
}
