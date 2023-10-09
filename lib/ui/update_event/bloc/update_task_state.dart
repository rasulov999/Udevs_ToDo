part of 'update_task_bloc.dart';

sealed class UpdateTaskState extends Equatable {
  const UpdateTaskState();
  
  @override
  List<Object> get props => [];
}

final class UpdateTaskInitial extends UpdateTaskState {}
