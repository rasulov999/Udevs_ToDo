part of 'delete_event_bloc_bloc.dart';

abstract class DeleteEventBlocEvent {}
 
class DeleteEvent extends DeleteEventBlocEvent {
  DeleteEvent({required this.eventModel});
  final EventModel eventModel;
}
