part of 'repository_bloc.dart';

sealed class RepositoryEvent extends Equatable {
  const RepositoryEvent();

  @override
  List<Object> get props => [];
}

final class RepositoryButtonClickedEvent extends RepositoryEvent {
  String repositoryUri;
  RepositoryButtonClickedEvent({required this.repositoryUri});
}
