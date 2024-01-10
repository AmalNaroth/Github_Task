import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:github_task/config/routes/app_routes.dart';
import 'package:github_task/core/navigation_services/navigator_services.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>((event, emit) async {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    });
  }
}
