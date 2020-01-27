/// Controller to mutate and query a MongoDB with graphql
class APIController {
  /// Used to add the correct variables to the mutation string addFindingsMutation in [Mutations]
  static addFinding(String kommune, String fylke, int count)  {

    var _dateNow = DateTime.now();
    var _dateDay = _dateNow.day < 10 ? '0${_dateNow.day}' : '${_dateNow.day}'; // To add a 0 if day less than 10.
    var _dateMonth = _dateNow.month < 10 ? '0${_dateNow.month}' : '${_dateNow.month}'; // To add a 0 if month less than 10.
    var _date = '$_dateDay.$_dateMonth.${_dateNow.year}';
    var _hour = _dateNow.hour < 10 ? '0${_dateNow.hour}' : '${_dateNow.hour}'; //  + 1 to correct from UTC time.
    var _minutes = _dateNow.minute < 10 ? '0${_dateNow.minute}' : '${_dateNow.minute}';

    return  { 
              'kommune': kommune,
              'fylke': fylke,
              'count': count,
              'date': _date,
              'time': '$_hour:$_minutes'
            };  
  }

  static queryFindingByFylke(String fylke) {
    return {
      'fylke': fylke
    };
  }

  static queryFindingByKommune(String kommune)  {
    return {
      'kommune': kommune
    };
  } 
  
  // Example: "14.12.2019"
  static queryFindingByDate(String date)  {
    return {
      'date': date
    };
  }
  // Example: "13:55"
  static queryFindingByTime(String time)  {

  }

  static queryAverageFindingTime() {

  }

  static queryMostFindingsDate() {

  }

  static queryMostFindingsKommune() {

  }

  static queryMostFindingsFylke() {

  }

  static queryFindingsPerDay()  {

  }

}