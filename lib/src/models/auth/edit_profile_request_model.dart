import 'package:likeminds_chat_fl/src/models/models.dart';

/// Request model for editing user profile
class EditProfileRequest {
  final String uuid;
  final String? imageUrl;
  final String? name;
  final String? widgetId;
  final Map<String, dynamic>? metadata;

  EditProfileRequest({
    required this.uuid,
    this.imageUrl,
    this.name,
    this.widgetId,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    if (imageUrl != null) data['image_url'] = imageUrl;
    if (name != null) data['name'] = name;
    if (widgetId != null) data['widget_id'] = widgetId;
    if (metadata != null) data['metadata'] = metadata;
    return data;
  }
}
