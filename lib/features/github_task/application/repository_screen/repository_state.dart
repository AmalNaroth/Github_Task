part of 'repository_bloc.dart';

sealed class RepositoryState extends Equatable {
  const RepositoryState();
  
  @override
  List<Object> get props => [];
}

final class RepositoryInitial extends RepositoryState {}
