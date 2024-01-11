import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_task/core/resources/data_class.dart';
import 'package:github_task/features/github_task/domain/repository_screen/repository_services.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';
import 'package:injectable/injectable.dart';

part 'repository_event.dart';
part 'repository_state.dart';


//getting repository items
@injectable
class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  RepositoryBloc(RepositoryServices repoInstance) : super(RepositoryInitial()) {
    on<RepositoryButtonClickedEvent>((event, emit) async {
      emit(
        RepositoryLoadingState(),
      );
      final reponse =
          await repoInstance.getRepositoryData(repUrl: event.repositoryUri);
      if (reponse is DataSuccess) {
        emit(
          RepositoryFoundState(
            repoData: reponse.data ?? [],
          ),
        );
      } else {
        emit(
          RepositoryNotFoundState(message: "Repository not found"),
        );
      }
    });
  }
}
