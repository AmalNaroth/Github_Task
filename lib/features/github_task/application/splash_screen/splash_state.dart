part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashNavigationState extends SplashState{}