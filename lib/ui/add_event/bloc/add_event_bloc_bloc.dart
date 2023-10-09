import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/tools/get_it.dart';

part 'add_event_bloc_event.dart';
part 'add_event_bloc_state.dart';

class AddEventBlocBloc extends Bloc<AddEventBlocEvent, AddEventBlocState> {
  AddEventBlocBloc()
      : super(
            AddEventBlocState(status: Status.pure, error: "", eventModel: [])) {
    on<AddEvent>(addNewEvent);
  }
  addNewEvent(AddEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    await getIt<EventsRepository>().insertToDb(event.eventModel);
    emit(state.copyWith(status: Status.added));
  }
}
