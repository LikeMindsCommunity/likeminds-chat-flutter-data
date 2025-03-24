import 'package:json_annotation/json_annotation.dart';

//TODO: CREATE ENTIRY
part 'profile_model.g.dart';

class Profile {
  final String name;

  Profile({
    required this.name,
  });
  factory Profile.fromEntity(ProfileEntity entity) {
    return Profile(
      name: entity.name!,
    );
  }
  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name,
    );
  }
}

@JsonSerializable()
class ProfileEntity {
  @JsonKey(name: "name")
  String? name;

  ProfileEntity({
    this.name,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}
