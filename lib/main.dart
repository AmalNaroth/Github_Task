import 'package:flutter/material.dart';
import 'package:github_task/config/routes/app_routes.dart';
import 'package:github_task/core/dependency_injection/dependency_injection.dart';
import 'package:github_task/core/navigation_services/navigator_services.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_task/features/github_task/application/home_screen/home_bloc.dart';
import 'package:github_task/features/github_task/application/repository_screen/repository_bloc.dart';
import 'package:github_task/features/github_task/application/splash_screen/splash_bloc.dart';
import 'package:github_task/features/github_task/infrastructure/repository/repository_screen_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  getRepositoryData(repUrl: "https://api.github.com/users/AmalNaroth/repos");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    mWidth = size.width;
    mHight = size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RepositoryBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Github Task',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
            scaffoldBackgroundColor: Colors.black),
        navigatorKey: NavigatorService.navigatorKey,
        routes: AppRoutes.approutes,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
