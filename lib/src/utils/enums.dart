/// enum to represent the type of ConversationState
enum ConversationState {
  normal,
  firstConversation,
  memberJoinedOpenChatroom,
  memberLeftOpenChatroom,
  memberAddedToChatroom,
  memberLeftSecretChatroom,
  memberRemovedFromChatroom,
  poll,
  allMembersAdded,
  topicChanged,
}

/// extension to convert ConversationState to int
extension ConversationStateExtension on ConversationState {
  int toInt() {
    switch (this) {
      case ConversationState.normal:
        return 0;
      case ConversationState.firstConversation:
        return 1;
      case ConversationState.memberJoinedOpenChatroom:
        return 2;
      case ConversationState.memberLeftOpenChatroom:
        return 3;
      case ConversationState.memberAddedToChatroom:
        return 7;
      case ConversationState.memberLeftSecretChatroom:
        return 8;
      case ConversationState.memberRemovedFromChatroom:
        return 9;
      case ConversationState.poll:
        return 10;
      case ConversationState.allMembersAdded:
        return 11;
      case ConversationState.topicChanged:
        return 12;
    }
  }
}
