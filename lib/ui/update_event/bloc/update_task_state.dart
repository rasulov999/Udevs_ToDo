part of 'update_task_bloc.dart';

 class UpdateTaskState extends Equatable {
 final Status? status;
  final String? error;
  final List<EventModel>? eventModel;

  const UpdateTaskState({this.status, this.error, this.eventModel});

  UpdateTaskState copyWith({
    Status? status,
    String? error,
    List<EventModel>? eventModel,
  }) =>
      UpdateTaskState(
          status: status ?? this.status,
          error: error ?? this.error,
          eventModel: eventModel ?? this.eventModel);
  @override
  List<Object?> get props => [status, error, eventModel];
}

