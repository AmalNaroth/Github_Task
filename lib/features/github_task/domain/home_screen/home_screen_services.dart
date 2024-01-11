import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/infrastructure/entites/user_entity.dart';


// user details featching service
abstract class HomeScreenServices{
  Future<DataState<UserEntity>> searchUser({required String userName});
}