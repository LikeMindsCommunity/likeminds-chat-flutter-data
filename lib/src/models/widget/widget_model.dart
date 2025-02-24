// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

class LMWidgetData {
  final String? id;
  final String? parentEntityId;
  final String? parentEntityType;
  final dynamic metadata;
  final dynamic lmMeta;
  final int? createdAt;
  final int? updatedAt;

  LMWidgetData({
    required this.id,
    required this.parentEntityId,
    required this.parentEntityType,
    this.metadata,
    this.lmMeta,
    this.createdAt,
    this.updatedAt,
  });

  factory LMWidgetData.fromEntity(LMWidgetDataEntity entity) {
    return LMWidgetData(
      id: entity.id,
      parentEntityId: entity.parentEntityId,
      parentEntityType: entity.parentEntityType,
      metadata: entity.metadata,
      lmMeta: entity.lmMeta,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  LMWidgetDataEntity toEntity() {
    return LMWidgetDataEntity(
      id: id,
      parentEntityId: parentEntityId,
      parentEntityType: parentEntityType,
      metadata: metadata,
      lmMeta: lmMeta,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

@JsonSerializable()
class LMWidgetDataEntity {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'parent_entity_id')
  final String? parentEntityId;

  @JsonKey(name: 'parent_entity_type')
  final String? parentEntityType;

  final dynamic metadata;

  @JsonKey(name: '_lm_meta')
  final dynamic lmMeta;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  LMWidgetDataEntity({
    required this.id,
    required this.parentEntityId,
    required this.parentEntityType,
    this.metadata,
    this.lmMeta,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'parentEntityId': parentEntityId,
      'parentEntityType': parentEntityType,
      'metadata': metadata,
      '_lm_meta': lmMeta,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory LMWidgetDataEntity.fromJson(Map<String, dynamic> map) {
    return LMWidgetDataEntity(
      id: map['_id'] != null ? map['_id'] as String : null,
      parentEntityId: map['parent_entity_id'] != null
          ? map['parent_entity_id'] as String
          : null,
      parentEntityType: map['parent_entity_type'] != null
          ? map['parent_entity_type'] as String
          : null,
      metadata: map['metadata'] as dynamic,
      lmMeta: map['_lm_meta'] as dynamic,
      createdAt: map['created_at'] != null ? map['created_at'] as int : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as int : null,
    );
  }
}
