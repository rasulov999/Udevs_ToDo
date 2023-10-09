import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/tools/get_it.dart';

part 'update_task_event.dart';
part 'update_task_state.dart';

class UpdateTaskBloc extends Bloc<UpdateTaskEvent, UpdateTaskState> {
  UpdateTaskBloc() : super(const UpdateTaskState()) {
    on<UpdateTask>(updateTask);
  }

  updateTask(UpdateTask event, Emitter emit) async {
    emit(state.copyWith(status: Status.added));
    getIt<EventsRepository>().updatedEvent(event.eventModel);
    emit(state.copyWith(status: Status.updated));
  }
}
