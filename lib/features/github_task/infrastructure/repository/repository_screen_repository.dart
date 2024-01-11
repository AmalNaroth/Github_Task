import 'package:dio/dio.dart';
import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/domain/repository_screen/repository_model.dart';
import 'package:github_task/features/github_task/domain/repository_screen/repository_services.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: RepositoryServices)
class RepositoryScreenRepository implements RepositoryServices{
  @override

//rpository data featching form api
Future<DataState<List<RepositoryEntity>>> getRepositoryData(
    {required String repUrl}) async {
  try {
    final response = await Dio(BaseOptions()).get(repUrl);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = response.data as List;
      final List<RepositoryEntity> listData = result
          .map(
            (e) => RepositoryModel.fromJson(e),
          )
          .toList();
      return DataSuccess(listData);
    } else {
      return DataFailed("Failed to fetch repository data");
    }
  } catch (e) {
    return DataFailed(
      e.toString(),
    );
  }
}


}