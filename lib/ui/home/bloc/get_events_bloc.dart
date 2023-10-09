import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/tools/get_it.dart';

part 'get_events_event.dart';
part 'get_events_state.dart';

class GetEventsBloc extends Bloc<GetEventsEvent, GetEventsState> {
  GetEventsBloc()
      : super(GetEventsState(error: "", eventModel: [], status: Status.pure)) {
    on<GetEventsEvent>(getAllEvents);
  }

  getAllEvents(GetEventsEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    List<EventModel> events = await getIt<EventsRepository>().getAllEvents();
    emit(state.copyWith(status: Status.success, eventModel: events));
  }
}
