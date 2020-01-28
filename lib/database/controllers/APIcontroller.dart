import 'package:SnegleStatistikkflutter/database/mutations/mutations.dart';
import 'package:SnegleStatistikkflutter/database/queries/queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// Controller to mutate and query Google Firestore with graphql
class APIController {
  /// Used to add the correct variables to the mutation string addFindingsMutation in [Mutations]
  static addFinding(String kommune, String fylke, int count)  {

    var _dateNow = DateTime.now();
    var _dateDay = _dateNow.day < 10 ? '0${_dateNow.day}' : '${_dateNow.day}'; // To add a 0 if day less than 10.
    var _dateMonth = _dateNow.month < 10 ? '0${_dateNow.month}' : '${_dateNow.month}'; // To add a 0 if month less than 10.
    var _date = '$_dateDay.$_dateMonth.${_dateNow.year}';
    var _hour = _dateNow.hour < 10 ? '0${_dateNow.hour}' : '${_dateNow.hour}';
    var _minutes = _dateNow.minute < 10 ? '0${_dateNow.minute}' : '${_dateNow.minute}';

    return  { 
              'kommune': kommune,
              'fylke': fylke,
              'count': count,
              'date': _date,
              'time': '$_hour:$_minutes'
            };  
  }
}