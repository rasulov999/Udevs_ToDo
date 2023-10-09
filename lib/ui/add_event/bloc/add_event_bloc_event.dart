part of 'add_event_bloc_bloc.dart';

abstract class AddEventBlocEvent {}

class AddEvent extends AddEventBlocEvent {
  AddEvent({required this.eventModel});
  final EventModel eventModel;
}
