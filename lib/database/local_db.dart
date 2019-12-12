//TODO: Implement local DB Static
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBProvider {
  LocalDBProvider._();

  static final LocalDBProvider db = LocalDBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {

    return await openDatabase(join(await getDatabasesPath(), 'local_db.db'), onCreate: (Database db, int version) async {
        return await db.execute(
          'CREATE TABLE local_db(id INTEGER PRIMARY KEY, kommune TEXT, fylke TEXT',
          );
      },
      version: 1,
    );
  }
}