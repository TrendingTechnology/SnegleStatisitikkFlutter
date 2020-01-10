import 'dart:async';
import 'package:slugflutter/database/local_db.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

String _userTable = 'slugflutter';
String _findingsTable = 'findings';

class LocalDBController {

  static Future<void> updateUserLocation(String fylke, String kommune) async {
    final Database db = await LocalDBProvider.db.database;

    // Update user location in DB.
    await db.rawUpdate(
      'UPDATE $_userTable SET fylke = ?, kommune = ? WHERE id = ?',
      [fylke, kommune, 1]
    );
  }

  static Future<void> addFinding(int count) async {

    var _dateNow = DateTime.now();
    var _date = '${_dateNow.day}.${_dateNow.month}.${_dateNow.year}';
    var _hour = _dateNow.hour + 1 < 10 ? '0${_dateNow.hour + 1}' : '${_dateNow.hour + 1}'; //  +1 to correct from UTC time.
    var _minutes = _dateNow.minute < 10 ? '0${_dateNow.minute}' : '${_dateNow.minute}';
    var _time = '$_hour:$_minutes';

    final Database db = await LocalDBProvider.db.database;

    Map<String, dynamic> _userMap = await LocalDBController.getAllSimpleUserData();

    int _oldTotalFinds = await _userMap['totalFinds'] ;
    int _oldMaxFind = await _userMap['maxFind'];

    int _newTotalFinds = _oldTotalFinds + count;
    int _newLastFind = count;
    int _newMaxFind = _oldMaxFind < count ? count : _oldMaxFind;


    // Update local DB.
    await db.rawUpdate(
      'UPDATE $_userTable SET totalFinds = ?, lastFind = ?, maxFind = ? WHERE id = ?',
      [_newTotalFinds, _newLastFind, _newMaxFind, 1]
    );

    await db.insert(_findingsTable, {'find': count, 'date': _date, 'time': _time});
  }

  /// Returns simple stats like maxfind, total found, last found and also fylke and kommune. Also saves all the queried data to the User singleton
  static Future<Map<String, dynamic>> getAllSimpleUserData() async {
    final Database db = await LocalDBProvider.db.database;

    // Query data from the DB
    final List<Map<String, dynamic>> userListMap = await db.query(_userTable);

    //Since only one user in DB, extract that user.
    Map<String, dynamic> _userMap = userListMap[0];
    User.fromMap(_userMap);

    print('User: $_userMap');
    // Return all the data from the DB as a map.
    return _userMap;
  }

  /// Returns the user choosen location, fylke and kommune.
  static Future<List<Map<String, dynamic>>> getUserLocation() async {
    final Database db = await LocalDBProvider.db.database;

    // Query data from the DB
    return await db.rawQuery('SELECT fylke, kommune FROM $_userTable');
  }

  /// Returns all the findings done by the user. Saved locally.
  static Future<List<Map<String, dynamic>>> getAllUserFindings() async  {
    final Database db = await LocalDBProvider.db.database;

    final List<Map<String, dynamic>> _findingsListMap = await db.query(_findingsTable);

    return _findingsListMap;
  }

}