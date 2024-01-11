// main.dart (or any other entry point file)
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:github_task/config/controller/network_controller.dart';
import 'package:github_task/core/dependency_injection/dependency_injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
    Get.put<NetworkController>(NetworkController(),permanent:true);
}


