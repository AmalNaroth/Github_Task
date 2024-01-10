part of 'repository_bloc.dart';

sealed class RepositoryState extends Equatable {
  const RepositoryState();
  
  @override
  List<Object> get props => [];
}

final class RepositoryInitial extends RepositoryState {}

final  class RepositoryLoadingState extends RepositoryState{}

final class RepositoryNotFoundState extends RepositoryState{
  String message;
  RepositoryNotFoundState({required this.message});
}

final class RepositoryFoundState extends RepositoryState{
  List<RepositoryEntity> repoData;
  RepositoryFoundState({required this.repoData});
}
