part of 'get_events_bloc.dart';

class GetEventsState extends Equatable {
 final  Status? status;
  final String? error;
  final List<EventModel>? eventModel;

 const GetEventsState(
      {required this.status, required this.error, required this.eventModel});

  GetEventsState copyWith({
    Status? status,
    String? error,
    List<EventModel>? eventModel,
  }) =>
      GetEventsState(
          status: status ?? this.status,
          error: error ?? this.error,
          eventModel: eventModel ?? this.eventModel);
  @override
  List<Object?> get props => [status, error, eventModel];
}
