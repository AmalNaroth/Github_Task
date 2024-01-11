import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';


//repository data featching service
abstract class RepositoryServices{
  Future<DataState<List<RepositoryEntity>>> getRepositoryData({required String repUrl});
}