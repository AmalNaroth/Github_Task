import 'package:flutter/material.dart';
import 'package:github_task/config/routes/app_routes.dart';
import 'package:github_task/core/navigation_services/navigator_services.dart';
import 'package:github_task/core/resources/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_task/features/github_task/application/bloc/splash_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
