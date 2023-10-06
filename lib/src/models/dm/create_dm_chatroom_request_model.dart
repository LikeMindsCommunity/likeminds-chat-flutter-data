class CreateDMChatroomRequest {
  int? memberId;
  String? uuid;

  CreateDMChatroomRequest._({
    required this.memberId,
    required this.uuid,
  });

  Map<String, dynamic> toJson() {
    return {
      "member_id": memberId,
      "uuid": uuid,
    };
  }
}

class CreateDMChatroomRequestBuilder {
  CreateDMChatroomRequestBuilder();

  int? _memberId;
  String? _uuid;

  void memberId(int memberId) => _memberId = memberId;
  void uuid(String uuid) => _uuid = uuid;

  CreateDMChatroomRequest build() {
    return CreateDMChatroomRequest._(
      memberId: _memberId,
      uuid: _uuid,
    );
  }
}
