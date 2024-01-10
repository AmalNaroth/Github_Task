import 'package:flutter/material.dart';
import 'package:github_task/features/github_task/presentation/home_screen/home_screen.dart';
import 'package:github_task/features/github_task/presentation/splash_screen/splash_screen.dart';

class AppRoutes{
  static const String splashScreen = "Splash-Screen";
  static const String homeScreen = 'Home-Screen';

  static Map<String,WidgetBuilder> get approutes =>{
    splashScreen : (context) => const SplashScreen(),
    homeScreen : (context) => const HomeScreen()
  };
}