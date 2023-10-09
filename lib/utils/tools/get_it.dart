import 'package:get_it/get_it.dart';
import 'package:udevs_todo/data/repository/events_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => EventsRepository()
  );
  getIt.registerLazySingleton(() => EventsRepository().getAllEvents()
  );
}
