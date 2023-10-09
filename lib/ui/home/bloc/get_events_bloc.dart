import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';
import 'package:udevs_todo/utils/form_status.dart';

part 'get_events_event.dart';
part 'get_events_state.dart';

class GetEventsBloc extends Bloc<GetEventsEvent, GetEventsState> {
  GetEventsBloc(this.repository)
      : super(GetEventsState(error: "", eventModel: [], status: Status.pure)) {
    on<GetEventsEvent>(getAllEvents);
  }
  EventsRepository repository;

  getAllEvents(GetEventsEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    List<EventModel> events = await repository.getAllEvents();
    emit(state.copyWith(status: Status.success, eventModel: events));
  }
}
