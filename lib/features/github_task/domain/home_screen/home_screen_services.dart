import 'package:github_task/core/resources/data_class.dart';

abstract class HomeScreenServices{
  Future<DataState> searchUser({required String userName});
}