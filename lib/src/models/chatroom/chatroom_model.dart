import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/chatroom/chatroom_member_model.dart';

part 'chatroom_model.g.dart';

class ChatRoom {
  final bool? access;
  final String? answerText;
  final int? answersCount;
  final int? attachmentCount;
  final List<dynamic>? attachments;
  final bool? attachmentsUploaded;
  final int? attendingCount;
  final bool? attendingStatus;
  final int? audioCount;
  final List<dynamic>? audios;
  final bool? autoFollowDone;
  final String? cardCreationTime;
  final int? communityId;
  final String? communityName;
  final dynamic? createdAt;
  final String? date;
  final int? dateEpoch;
  final int? dateTime;
  final int? duration;
  final bool? followStatus;
  final bool? hasEventRecording;
  final String header;
  final int id;
  final int? imageCount;
  final List<dynamic>? images;
  final bool? includeMembersLater;
  final bool? isEdited;
  final bool? isGuest;
  final bool? isPaid;
  final bool? isPending;
  final bool? isPrivate;
  final bool? isPrivateMember;
  final bool? isSecret;
  final bool? isTagged;
  final ChatRoomMember? member;
  final bool? muteStatus;
  final int? onlineLinkEnableBefore;
  final dynamic onlineLinkType;
  final List<dynamic>? pdf;
  final int? pdfCount;
  final int? pollsCount;
  final List<dynamic>? reactions;
  final bool? secretChatroomLeft;
  final String? shareLink;
  final int? state;
  final String title;
  final int? type;
  final int? videoCount;
  final List<dynamic>? videos;

  ChatRoom({
    this.access,
    this.answerText,
    this.answersCount,
    this.attachmentCount,
    this.attachments,
    this.attachmentsUploaded,
    this.attendingCount,
    this.attendingStatus,
    this.audioCount,
    this.audios,
    this.autoFollowDone,
    this.cardCreationTime,
    this.communityId,
    this.communityName,
    this.createdAt,
    this.date,
    this.dateEpoch,
    this.dateTime,
    this.duration,
    this.followStatus,
    this.hasEventRecording,
    required this.header,
    required this.id,
    this.imageCount,
    this.images,
    this.includeMembersLater,
    this.isEdited,
    this.isGuest,
    this.isPaid,
    this.isPending,
    this.isPrivate,
    this.isPrivateMember,
    this.isSecret,
    this.isTagged,
    this.member,
    this.muteStatus,
    this.onlineLinkEnableBefore,
    this.onlineLinkType,
    this.pdf,
    this.pdfCount,
    this.pollsCount,
    this.reactions,
    this.secretChatroomLeft,
    this.shareLink,
    this.state,
    required this.title,
    this.type,
    this.videoCount,
    this.videos,
  });

  factory ChatRoom.fromEntity(ChatRoomEntity entity) {
    return ChatRoom(
      access: entity.access,
      answerText: entity.answerText,
      answersCount: entity.answersCount,
      attachmentCount: entity.attachmentCount,
      attachments: entity.attachments,
      attachmentsUploaded: entity.attachmentsUploaded,
      attendingCount: entity.attendingCount,
      attendingStatus: entity.attendingStatus,
      audioCount: entity.audioCount,
      audios: entity.audios,
      autoFollowDone: entity.autoFollowDone,
      cardCreationTime: entity.cardCreationTime,
      communityId: entity.communityId,
      communityName: entity.communityName,
      createdAt: entity.createdAt,
      date: entity.date,
      dateEpoch: entity.dateEpoch,
      dateTime: entity.dateTime,
      duration: entity.duration,
      followStatus: entity.followStatus,
      hasEventRecording: entity.hasEventRecording,
      header: entity.header,
      id: entity.id,
      imageCount: entity.imageCount,
      images: entity.images,
      includeMembersLater: entity.includeMembersLater,
      isEdited: entity.isEdited,
      isGuest: entity.isGuest,
      isPaid: entity.isPaid,
      isPending: entity.isPending,
      isPrivate: entity.isPrivate,
      isPrivateMember: entity.isPrivateMember,
      isSecret: entity.isSecret,
      isTagged: entity.isTagged,
      member: entity.member != null
          ? ChatRoomMember.fromEntity(entity.member!)
          : null,
      muteStatus: entity.muteStatus,
      onlineLinkEnableBefore: entity.onlineLinkEnableBefore,
      onlineLinkType: entity.onlineLinkType,
      pdf: entity.pdf,
      pdfCount: entity.pdfCount,
      pollsCount: entity.pollsCount,
      reactions: entity.reactions,
      secretChatroomLeft: entity.secretChatroomLeft,
      shareLink: entity.shareLink,
      state: entity.state,
      title: entity.title,
      type: entity.type,
      videoCount: entity.videoCount,
      videos: entity.videos,
    );
  }

  ChatRoomEntity toEntity() {
    return ChatRoomEntity(
      access: access,
      answerText: answerText,
      answersCount: answersCount,
      attachmentCount: attachmentCount,
      attachments: attachments,
      attachmentsUploaded: attachmentsUploaded,
      attendingCount: attendingCount,
      attendingStatus: attendingStatus,
      audioCount: audioCount,
      audios: audios,
      autoFollowDone: autoFollowDone,
      cardCreationTime: cardCreationTime,
      communityId: communityId,
      communityName: communityName,
      createdAt: createdAt,
      date: date,
      dateEpoch: dateEpoch,
      dateTime: dateTime,
      duration: duration,
      followStatus: followStatus,
      hasEventRecording: hasEventRecording,
      header: header,
      id: id,
      imageCount: imageCount,
      images: images,
      includeMembersLater: includeMembersLater,
      isEdited: isEdited,
      isGuest: isGuest,
      isPaid: isPaid,
      isPending: isPending,
      isPrivate: isPrivate,
      isPrivateMember: isPrivateMember,
      isSecret: isSecret,
      isTagged: isTagged,
      member: member!.toEntity(),
      muteStatus: muteStatus,
      onlineLinkEnableBefore: onlineLinkEnableBefore,
      onlineLinkType: onlineLinkType,
      pdf: pdf,
      pdfCount: pdfCount,
      pollsCount: pollsCount,
      reactions: reactions,
      secretChatroomLeft: secretChatroomLeft,
      shareLink: shareLink,
      state: state,
      title: title,
      type: type,
      videoCount: videoCount,
      videos: videos,
    );
  }
}

@JsonSerializable()
class ChatRoomEntity {
  final bool? access;
  @JsonKey(name: 'answer_text')
  final String? answerText;
  @JsonKey(name: 'answers_count')
  final int? answersCount;
  @JsonKey(name: 'attachment_count')
  final int? attachmentCount;
  final List<dynamic>? attachments;
  @JsonKey(name: 'attachments_uploaded')
  final bool? attachmentsUploaded;
  @JsonKey(name: 'attending_count')
  final int? attendingCount;
  @JsonKey(name: 'attending_status')
  final bool? attendingStatus;
  @JsonKey(name: 'audio_count')
  final int? audioCount;
  final List<dynamic>? audios;
  @JsonKey(name: 'auto_follow_done')
  final bool? autoFollowDone;
  @JsonKey(name: 'card_creation_time')
  final String? cardCreationTime;
  @JsonKey(name: 'community_id')
  final int? communityId;
  @JsonKey(name: 'community_name')
  final String? communityName;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  final String? date;
  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;
  @JsonKey(name: 'date_time')
  final int? dateTime;
  final int? duration;
  @JsonKey(name: 'follow_status')
  final bool? followStatus;
  @JsonKey(name: 'has_event_recording')
  final bool? hasEventRecording;
  final String header;
  final int id;
  @JsonKey(name: 'image_count')
  final int? imageCount;
  final List<dynamic>? images;
  @JsonKey(name: 'include_members_later')
  final bool? includeMembersLater;
  @JsonKey(name: 'is_edited')
  final bool? isEdited;
  @JsonKey(name: 'is_guest')
  final bool? isGuest;
  @JsonKey(name: 'is_paid')
  final bool? isPaid;
  @JsonKey(name: 'is_pending')
  final bool? isPending;
  @JsonKey(name: 'is_private')
  final bool? isPrivate;
  @JsonKey(name: 'is_private_member')
  final bool? isPrivateMember;
  @JsonKey(name: 'is_secret')
  final bool? isSecret;
  @JsonKey(name: 'is_tagged')
  final bool? isTagged;
  final ChatRoomMemberEntity? member;
  @JsonKey(name: 'mute_status')
  final bool? muteStatus;
  @JsonKey(name: 'online_link_enable_before')
  final int? onlineLinkEnableBefore;
  @JsonKey(name: 'online_link_type')
  final dynamic onlineLinkType;
  final List<dynamic>? pdf;
  @JsonKey(name: 'pdf_count')
  final int? pdfCount;
  @JsonKey(name: 'polls_count')
  final int? pollsCount;
  final List<dynamic>? reactions;
  @JsonKey(name: 'secret_chatroom_left')
  final bool? secretChatroomLeft;
  @JsonKey(name: 'share_link')
  final String? shareLink;
  final int? state;
  final String title;
  final int? type;
  @JsonKey(name: 'video_count')
  final int? videoCount;
  final List<dynamic>? videos;

  ChatRoomEntity({
    this.access,
    this.answerText,
    this.answersCount,
    this.attachmentCount,
    this.attachments,
    this.attachmentsUploaded,
    this.attendingCount,
    this.attendingStatus,
    this.audioCount,
    this.audios,
    this.autoFollowDone,
    this.cardCreationTime,
    this.communityId,
    this.communityName,
    this.createdAt,
    this.date,
    this.dateEpoch,
    this.dateTime,
    this.duration,
    this.followStatus,
    this.hasEventRecording,
    required this.header,
    required this.id,
    this.imageCount,
    this.images,
    this.includeMembersLater,
    this.isEdited,
    this.isGuest,
    this.isPaid,
    this.isPending,
    this.isPrivate,
    this.isPrivateMember,
    this.isSecret,
    this.isTagged,
    this.member,
    this.muteStatus,
    this.onlineLinkEnableBefore,
    this.onlineLinkType,
    this.pdf,
    this.pdfCount,
    this.pollsCount,
    this.reactions,
    this.secretChatroomLeft,
    this.shareLink,
    this.state,
    required this.title,
    this.type,
    this.videoCount,
    this.videos,
  });

  factory ChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomEntityToJson(this);
}
