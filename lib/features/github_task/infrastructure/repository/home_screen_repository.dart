import 'package:dio/dio.dart';
import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/domain/home_screen/home_screen_services.dart';
import 'package:github_task/features/github_task/domain/home_screen/user_model.dart';
import 'package:github_task/features/github_task/infrastructure/entites/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeScreenServices)
class HomeScreenRepository implements HomeScreenServices {
  @override
  Future<DataState<UserEntity>> searchUser({required String userName}) async {
    try {
      final response = await Dio(
        BaseOptions(),
      ).get("https://api.github.com/users/$userName");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(response.data);
        return DataSuccess(
            result); // Assuming DataSuccess is renamed to DataState.success
      } else {
        return const DataFailed(
            "Failed to fetch user data"); // Assuming DataFailed is renamed to DataState.failed
      }
    } catch (e) {
      return DataFailed(
        e.toString(),
      ); // Return the error message as a string
    }
  }
}
