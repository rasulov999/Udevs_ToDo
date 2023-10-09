part of 'update_task_bloc.dart';

abstract class UpdateTaskEvent {}

class UpdateTask extends UpdateTaskEvent{
  UpdateTask({required this.eventModel});
  final EventModel eventModel;
}
