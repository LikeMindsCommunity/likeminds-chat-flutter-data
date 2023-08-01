class PollViewData {
  int? id;
  final String text;
  bool? isSelected;
  int? percentage;
  int? noVotes;
  final int? memberId;
  final int? conversationId;
  final int? chatroomId;
  int? count;

  PollViewData({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.noVotes,
    this.memberId,
    this.conversationId,
    this.chatroomId,
    this.count,
  });

  factory PollViewData.fromEntity(PollViewDataEntity entity) {
    return PollViewData(
      id: entity.id,
      text: entity.text,
      isSelected: entity.isSelected,
      percentage: entity.percentage,
      noVotes: entity.noVotes,
      memberId: entity.memberId,
      conversationId: entity.conversationId,
      chatroomId: entity.chatroomId,
      count: entity.count,
    );
  }

  PollViewDataEntity toEntity() {
    return PollViewDataEntity(
      id: id,
      text: text,
      isSelected: isSelected,
      percentage: percentage,
      noVotes: noVotes,
      memberId: memberId,
      chatroomId: chatroomId,
      conversationId: conversationId,
      count: count,
    );
  }
}

class PollViewDataEntity {
  final int? id;
  final String text;
  final bool? isSelected;
  final int? percentage;
  final int? noVotes;
  final int? count;
  final int? memberId;
  final int? conversationId;
  final int? chatroomId;

  PollViewDataEntity({
    this.id,
    required this.text,
    this.isSelected,
    this.percentage,
    this.count,
    this.noVotes,
    this.memberId,
    this.conversationId,
    this.chatroomId,
  });

  factory PollViewDataEntity.fromJson(Map<String, dynamic> json) {
    return PollViewDataEntity(
      id: json['id'],
      text: json['text'],
      isSelected: json['is_selected'],
      percentage: json['percentage'],
      noVotes: json['no_votes'],
      memberId: json['user_id'],
      conversationId: json['conversation_id'],
      chatroomId: json['chatroom_id'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'text': text,
      'is_selected': isSelected,
      'percentage': percentage,
      'no_votes': noVotes,
      'conversation_id': conversationId,
      'user_id': memberId,
      'count': count,
    };

    return data;
  }
}
