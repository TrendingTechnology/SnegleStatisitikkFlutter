import 'dart:async';
import 'package:slugflutter/database/local_db.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

//TODO: Methods for manipulatin the local DB.

String _dbName = 'slugflutter';

class LocalDBController {

  static Future<void> updateUser(String fylke, String kommune) async {
    final Database db = await LocalDBProvider.db.database;

    User.setFylke = fylke;
    User.setKommune = kommune;

    await db.rawUpdate(
      'UPDATE slugflutter SET fylke = ?, kommune = ? WHERE id = ?',
      [fylke, kommune, 1]
    );
    print('Updated: $fylke, $kommune');
  }

  static Future<Map<String, dynamic>> checkUserData() async {
    final Database db = await LocalDBProvider.db.database;

    final List<Map<String, dynamic>> userListMap = await db.query(_dbName);

    Map<String, dynamic> _userMap;
    userListMap.forEach((user) => _userMap = user);

    String _fylke = await _userMap['fylke'];
    String _kommune = await _userMap['kommune'];

    User.setFylke = _fylke == null ? '' : _fylke;
    User.setKommune = _kommune == null ? '' : _kommune;
    User.setTotalFinds = await _userMap['totalFinds'];
    User.setLastFind = await _userMap['lastFind'];
    User.setMaxFind = await _userMap['maxFind'];

    print('User: $_userMap');
    return _userMap;
  }

  static Future<void> addFinding(int count) async {
    // TODO: ALSO ADD TO THE REMOTE MONGO DB.
    final Database db = await LocalDBProvider.db.database;

    User.addFind(count);

    await db.rawUpdate(
    'UPDATE slugflutter SET totalFinds = ?, lastFind = ?, maxFind = ? WHERE id = ?',
    [User.getTotalFinds, User.getLastFind, User.getMaxFind, 1]);
  }

}