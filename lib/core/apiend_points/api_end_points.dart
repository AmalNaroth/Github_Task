
import 'package:dio/dio.dart';

class Github {
  final String userName;
  final String url = 'api.github.com';
  static String token = 'Your_github_client_id';

  Github(this.userName);

  Future<Response> fetchUser() async {
    Dio dio = Dio(
      BaseOptions(),
    );
    try {
      Response response = await dio.get(
        'https://$url/users/$userName',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return response;
    } catch (error) {
      throw Exception('Failed to load user data');
    }
  }

  Future<Response> fetchFollowing() async {
    Dio dio = Dio(
      BaseOptions(),
    );
    try {
      Response response = await dio.get(
        'https://$url/users/$userName/followers',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return response;
    } catch (error) {
      throw Exception('Failed to load followers data');
    }
  }
}
