//TODO: Implement local DB Static
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/user_model.dart';

class LocalDBProvider {
  LocalDBProvider._();

  static final LocalDBProvider db = LocalDBProvider._();

  static Database _database;
  String _dbName = 'slugflutter';

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await _initDB();
    
    //TODO: Migrate with User before return!

    await _database.insert(_dbName, User.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    print('Inserted');

    return _database;
  }

  _initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'local_db.db'), onCreate: (Database db, int version) async {
        return await db.execute(
          'CREATE TABLE slugflutter(id INTEGER PRIMARY KEY, fylke TEXT, kommune TEXT, totalFinds INTEGER, lastFind INTEGER, maxFind INTEGER)',
          );
      },
      version: 1,
      singleInstance: true
    );

    
  }
}