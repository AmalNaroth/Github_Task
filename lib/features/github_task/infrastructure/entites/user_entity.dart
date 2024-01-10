import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? url;
  String? reposUrl;
  String? type;
  String? name;
  String? company;
  String? location;
  String? bio;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  UserEntity({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.reposUrl,
    this.type,
    this.name,
    this.company,
    this.location,
    this.bio,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        login,
        id,
        nodeId,
        avatarUrl,
        url,
        reposUrl,
        type,
        name,
        company,
        location,
        bio,
        followers,
        following,
        createdAt,
        updatedAt,
      ];
}
