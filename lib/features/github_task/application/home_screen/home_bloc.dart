import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';
import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/domain/home_screen/home_screen_services.dart';
import 'package:github_task/features/github_task/infrastructure/entites/user_entity.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeScreenServices homeInstance)
      : super(
          HomeInitialState(),
        ) {
    on<HomeSeachButtonClickEvent>((event, emit) async {
      emit(
        HomeLoadingState(),
      );
      final reponse = await homeInstance.searchUser(userName: event.userName);
      if (reponse is DataSuccess) {
        emit(
          HomeUserFoundState(userData: reponse.data),
        );
      } else {
        emit(
          HomeNoUserFoundState(message: "No user found"),
        );
      }
    });
  }
}
