class Reaction {
  int? chatroomId;
  int conversationId;
  int? reactionId;
  int userId;
  String reaction;

  Reaction({
    this.chatroomId,
    required this.conversationId,
    this.reactionId,
    required this.userId,
    required this.reaction,
  });

  factory Reaction.fromEntity(ReactionEntity entity) {
    return Reaction(
      chatroomId: entity.chatroomId!,
      conversationId: entity.conversationId!,
      reactionId: entity.reactionId!,
      userId: entity.userId!,
      reaction: entity.reaction!,
    );
  }

  ReactionEntity toEntity() {
    return ReactionEntity(
      chatroomId: chatroomId,
      conversationId: conversationId,
      reactionId: reactionId,
      userId: userId,
      reaction: reaction,
    );
  }
}

class ReactionEntity {
  int? chatroomId;
  int? conversationId;
  int? reactionId;
  int? userId;
  String? reaction;

  ReactionEntity({
    this.chatroomId,
    this.conversationId,
    this.reactionId,
    this.userId,
    this.reaction,
  });

  factory ReactionEntity.fromJson(Map<String, dynamic> json) {
    return ReactionEntity(
      chatroomId: json['chatroom_id'],
      conversationId: json['conversation_id'],
      reactionId: json['id'],
      userId: json['user_id'],
      reaction: json['reaction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatroom_id': chatroomId,
      'conversation_id': conversationId,
      'id': reactionId,
      'user_id': userId,
      'reaction': reaction,
    };
  }
}
