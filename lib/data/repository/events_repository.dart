import 'package:udevs_todo/data/database/local_database.dart';
import 'package:udevs_todo/data/models/event_model.dart';

class EventsRepository {
  EventsRepository();
  Future<List<EventModel>> getAllEvents() => LocalDatabase.getEvents();

  Future<EventModel> insertToDb(EventModel eventModel) =>
      LocalDatabase.insertToDb(eventModel);

  Future<int> deleteEventById(int id) => LocalDatabase.deleteEventById(id);

Future<int> updatedEvent(EventModel eventModel)=>LocalDatabase.updateEvent(eventModel);

}
