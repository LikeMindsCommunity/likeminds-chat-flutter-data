import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? token;
  final String? refreshToken;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.token,
    this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
