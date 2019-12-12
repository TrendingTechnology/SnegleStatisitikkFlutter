import 'dart:async';
import 'package:slugflutter/database/local_db.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

//TODO: Methods for manipulatin the local DB.

Future<void> addUser(User user) async {
  final Database db = await LocalDBProvider.db.database;

  await db.insert('local:db', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}