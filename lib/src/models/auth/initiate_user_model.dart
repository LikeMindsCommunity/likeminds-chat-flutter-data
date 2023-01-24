import 'package:likeminds_groupchat/src/models/auth/community_model.dart';
import 'package:likeminds_groupchat/src/models/auth/user_model.dart';

class InitiateUser {
  User user;
  Community community;

  InitiateUser({required this.user, required this.community});

  factory InitiateUser.fromJson(Map<String, dynamic> json) {
    return InitiateUser(
      user: User.fromJson(json['user']),
      community: Community.fromJson(json['community']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['community'] = community.toJson();
    return data;
  }
}
