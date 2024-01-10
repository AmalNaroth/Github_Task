import 'package:github_task/features/github_task/infrastructure/entites/user_entity.dart';

class UserModel extends UserEntity {
  String? additionalProperty;

  UserModel({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? url,
    String? reposUrl,
    String? type,
    String? name,
    String? company,
    String? location,
    String? bio,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
    this.additionalProperty,
  }) : super(
          login: login,
          id: id,
          nodeId: nodeId,
          avatarUrl: avatarUrl,
          url: url,
          reposUrl: reposUrl,
          type: type,
          name: name,
          company: company,
          location: location,
          bio: bio,
          followers: followers,
          following: following,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    reposUrl = json['repos_url'];
    type = json['type'];
    name = json['name'];
    company = json['company'];
    location = json['location'];
    bio = json['bio'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  @override
  List<Object?> get props => super.props + [additionalProperty];
}