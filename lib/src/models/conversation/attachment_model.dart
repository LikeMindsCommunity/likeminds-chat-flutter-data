import 'dart:io';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'attachment_model.g.dart';

class Attachment {
  final int? answerId;
  final int? createdAt;
  final dynamic dimensions;
  String? fileUrl;
  String? url;
  File? attachmentFile;
  Uint8List? attachmentBytes;
  final dynamic height;
  final int? id;
  final int? index;
  final dynamic locationLat;
  final dynamic locationLong;
  final dynamic locationName;
  final dynamic meta;
  final String? name;
  String? thumbnailUrl;
  File? thumbnailFile;
  Uint8List? thumbnailBytes;
  final String? type;
  final dynamic width;

  Attachment({
    required this.answerId,
    this.createdAt,
    this.dimensions,
    this.fileUrl,
    this.attachmentBytes,
    this.height,
    this.id,
    this.index,
    this.locationLat,
    this.locationLong,
    this.locationName,
    this.meta,
    this.name,
    this.thumbnailUrl,
    required this.type,
    this.width,
    this.url,
    this.attachmentFile,
    this.thumbnailFile,
    this.thumbnailBytes,
  });

  factory Attachment.fromEntity(AttachmentEntity entity) {
    return Attachment(
      answerId: entity.answerId,
      createdAt: entity.createdAt,
      dimensions: entity.dimensions,
      fileUrl: entity.fileUrl,
      height: entity.height,
      id: entity.id,
      index: entity.index,
      locationLat: entity.locationLat,
      locationLong: entity.locationLong,
      locationName: entity.locationName,
      meta: entity.meta,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
      type: entity.type,
      width: entity.width,
      url: entity.url,
    );
  }

  AttachmentEntity toEntity() {
    return AttachmentEntity(
      answerId: answerId,
      createdAt: createdAt,
      dimensions: dimensions,
      fileUrl: fileUrl,
      url: url,
      height: height,
      id: id,
      index: index,
      locationLat: locationLat,
      locationLong: locationLong,
      locationName: locationName,
      meta: meta,
      name: name,
      thumbnailUrl: thumbnailUrl,
      type: type,
      width: width,
    );
  }
}

@JsonSerializable()
class AttachmentEntity {
  @JsonKey(name: 'answer_id')
  final int? answerId;
  @JsonKey(name: 'created_at')
  final int? createdAt;
  final dynamic dimensions;
  @JsonKey(name: 'file_url')
  final String? fileUrl;
  final dynamic height;
  final int? id;
  final int? index;
  @JsonKey(name: 'location_lat')
  final dynamic locationLat;
  @JsonKey(name: 'location_long')
  final dynamic locationLong;
  @JsonKey(name: 'location_name')
  final dynamic locationName;
  final dynamic meta;
  final String? name;
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  final String? type;
  final dynamic width;
  final String? url;

  AttachmentEntity({
    required this.answerId,
    required this.createdAt,
    required this.dimensions,
    required this.fileUrl,
    required this.height,
    required this.id,
    required this.index,
    required this.locationLat,
    required this.locationLong,
    required this.locationName,
    required this.meta,
    required this.name,
    required this.thumbnailUrl,
    required this.type,
    required this.width,
    required this.url,
  });

  factory AttachmentEntity.fromJson(Map<String, dynamic> json) =>
      _$AttachmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);
}
