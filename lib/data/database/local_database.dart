import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/utils/constants.dart';

class LocalDatabase {
  LocalDatabase._init();
  static final LocalDatabase getInstance = LocalDatabase._init();
  factory LocalDatabase() {
    return getInstance;
  }
  static Database? _database;

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return _database = await _initDb("todo.db");
    }
  }

  Future<Database> _initDb(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        // String intType = "INTEGER";
        // String boolType = "INTEGER";

        await db.execute('''
       CREATE TABLE $tableName (
        ${EvetFields.id} $idType,
        ${EvetFields.name} $textType,
        ${EvetFields.description} $textType,
        ${EvetFields.location} $textType,
       )
        ''');
      },
    );
  }

  static Future<EventModel> insertToDb(EventModel eventModel) async {
    var db = await getInstance.getDb();
    final id = await db.insert(tableName, eventModel.toJson());
    return eventModel.copyWith(id: id);
  }

  static Future<List<EventModel>> getEvents() async {
    final dataBase = await getInstance.getDb();
    final listOfEvent = await dataBase.query(tableName, columns: [
      EvetFields.id,
      EvetFields.name,
      EvetFields.description,
      EvetFields.location,
      // EvetFields.color
    ]);
    var list = listOfEvent.map((e) => EventModel.fromJson(e)).toList();
    return list;
  }

  static Future<int> deleteEventById(int id) async {
    final db = await getInstance.getDb();
    return db.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  static Future<int> updateEvent(EventModel eventModel) async {
    Map<String, dynamic> col = {
      EvetFields.name: eventModel.name,
      EvetFields.description: eventModel.description,
      EvetFields.location: EvetFields.location,
    };

    final db = await getInstance.getDb();
    return await db.update(
      tableName,
      col,
      where: '${EvetFields.id} = ?',
      whereArgs: [eventModel.id],
    );
  }
}
