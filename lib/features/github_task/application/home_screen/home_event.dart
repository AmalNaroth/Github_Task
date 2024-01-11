part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable

//event for seaching
final class HomeSeachButtonClickEvent extends HomeEvent {
  String userName;
  HomeSeachButtonClickEvent({required this.userName});
  @override
  List<Object> get props => [userName];
}
