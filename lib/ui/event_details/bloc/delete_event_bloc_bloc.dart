import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/tools/get_it.dart';

part 'delete_event_bloc_event.dart';
part 'delete_event_bloc_state.dart';

class DeleteEventBlocBloc
    extends Bloc<DeleteEventBlocEvent, DeleteEventBlocState> {
  DeleteEventBlocBloc() : super(DeleteEventBlocState()) {
    on<DeleteEvent>(deleteEvent);
  }
  deleteEvent(DeleteEvent event, Emitter emit) async {
    await getIt<EventsRepository>().deleteEventById(event.eventModel.id!);
    emit(state.copyWith(status: Status.deleted));
    // add(GetAllEvents() as DeleteEventBlocEvent);
  }
}
