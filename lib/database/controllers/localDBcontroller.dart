import 'dart:async';
import 'package:slugflutter/database/local_db.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

//TODO: Methods for manipulatin the local DB.

String dbName = 'slugflutter';

class LocalDBController {

  static Future<void> addUpdateUser(User user) async {
    final Database db = await LocalDBProvider.db.database;

    await db.insert(dbName, user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<User> get getUser async {
    final Database db = await LocalDBProvider.db.database;

    final List<Map<String, dynamic>> userListMap = await db.query(dbName);

    Map<String, dynamic> _userMap;
    userListMap.forEach((user) => _userMap = user);

    if (_userMap == null) {
      return null;
    }

    return User(
      id: await _userMap['id'],
      fylke: await _userMap['fylke'],
      kommune: await _userMap['kommune'],
      totalFinds: await _userMap['totalFinds'],
      lastFind: await _userMap['lastFind'],
      maxFind: await _userMap['maxFind']
    );
  }

  static Future<void> addFinding(int count) async {
    // TODO: ALSO ADD TO THE REMOTE MONGO DB.
    final Database db = await LocalDBProvider.db.database;

    int _newTotalFinds;
    int _newLastFind;
    int _newMaxFind;   
  }

}