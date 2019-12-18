import 'dart:async';
import 'package:slugflutter/database/local_db.dart';
import 'package:sqflite/sqflite.dart';

String _dbName = 'slugflutter';

class LocalDBController {

  static Future<void> updateUserLocation(String fylke, String kommune) async {
    final Database db = await LocalDBProvider.db.database;

    // Update user location in DB.
    await db.rawUpdate(
      'UPDATE slugflutter SET fylke = ?, kommune = ? WHERE id = ?',
      [fylke, kommune, 1]
    );
  }

  static Future<int> addFinding(int count) async {
    // TODO: ALSO ADD TO THE REMOTE MONGO DB.

    final Database db = await LocalDBProvider.db.database;

    Map<String, dynamic> _userMap = await LocalDBController.getAllUserData();

    int _oldTotalFinds = await _userMap['totalFinds'] ;
    int _oldMaxFind = await _userMap['maxFind'];

    int _newTotalFinds = _oldTotalFinds + count;
    int _newLastFind = count;
    int _newMaxFind = _oldMaxFind < count ? count : _oldMaxFind;


    // Update local DB.
    await db.rawUpdate(
    'UPDATE slugflutter SET totalFinds = ?, lastFind = ?, maxFind = ? WHERE id = ?',
    [_newTotalFinds, _newLastFind, _newMaxFind, 1]);

    return _newTotalFinds;
  }

  static Future<Map<String, dynamic>> getAllUserData() async {
    final Database db = await LocalDBProvider.db.database;

    // Query data from the DB
    final List<Map<String, dynamic>> userListMap = await db.query(_dbName);

    //Since only one user in DB, extract that user.
    Map<String, dynamic> _userMap;
    userListMap.forEach((user) => _userMap = user);

    print('User: $_userMap');
    // Return all the data from the DB as a map.
    return _userMap;
  }

  static Future<List<Map<String, dynamic>>> getUserLocation() async {
    final Database db = await LocalDBProvider.db.database;

    // Query data from the DB
    return await db.rawQuery('SELECT fylke, kommune FROM slugflutter');
  }

}