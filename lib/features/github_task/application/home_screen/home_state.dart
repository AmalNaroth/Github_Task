part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeNoUserFoundState extends HomeState {
  String message;
  HomeNoUserFoundState({required this.message});
  @override
  List<Object> get props => [message];
}

final class HomeUserFoundState extends HomeState {
  UserEntity userData;
  HomeUserFoundState({required this.userData});
  @override
  List<Object> get props => [userData];
}
