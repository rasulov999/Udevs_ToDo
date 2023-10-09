part of 'delete_event_bloc_bloc.dart';

class DeleteEventBlocState extends Equatable {
  final Status? status;
  final String? error;
  final List<EventModel>? eventModel;

  const DeleteEventBlocState({this.status, this.error, this.eventModel});

  DeleteEventBlocState copyWith({
    Status? status,
    String? error,
    List<EventModel>? eventModel,
  }) =>
      DeleteEventBlocState(
          status: status ?? this.status,
          error: error ?? this.error,
          eventModel: eventModel ?? this.eventModel);
  @override
  List<Object?> get props => [status, error, eventModel];
}
