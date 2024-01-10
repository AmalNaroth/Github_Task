import 'package:equatable/equatable.dart';

class RepositoryEntity extends Equatable {
   int? id;
   String? nodeId;
   String? name;
   String? fullName;
   String? htmlUrl;
   String? createdAt;
   String? updatedAt;
   String? pushedAt;
   String? language;
   String? visibility;

  RepositoryEntity({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.language,
    this.visibility,
  });

  @override
  List<Object?> get props => [
        id,
        nodeId,
        name,
        fullName,
        htmlUrl,
        createdAt,
        updatedAt,
        pushedAt,
        language,
        visibility,
      ];
}


