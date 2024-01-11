import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';


//repository data model class
class RepositoryModel extends RepositoryEntity {

  RepositoryModel({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    String? htmlUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? language,
    String? visibility,
    int? repo
  }) : super(
          id: id,
          nodeId: nodeId,
          name: name,
          fullName: fullName,
          htmlUrl: htmlUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
          pushedAt: pushedAt,
          language: language,
          visibility: visibility,
        );

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    htmlUrl = json['html_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    language = json['language'];
    visibility = json['visibility'];
  }

  @override
  List<Object?> get props => [...super.props];

  // You can add additional methods or properties specific to RepositoryModel here.
}
