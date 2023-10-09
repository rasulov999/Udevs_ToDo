part of 'add_event_bloc_bloc.dart';

class AddEventBlocState extends Equatable {
  final Status? status;
 final  String? error;
  final List<EventModel>? eventModel;

 const  AddEventBlocState(
      {required this.status, required this.error, required this.eventModel});

  AddEventBlocState copyWith({
    Status? status,
    String? error,
    List<EventModel>? eventModel,
  }) =>
      AddEventBlocState(
          status: status ?? this.status,
          error: error ?? this.error,
          eventModel: eventModel ?? this.eventModel);
  @override
  List<Object?> get props => [status, error, eventModel];
}
