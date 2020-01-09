//Singleton, only one user in this app locally, no login or users in the backend.
class User {
  static final int _id = 1;
  static String _fylke;
  static String _kommune;
  static int _totalFinds = 0;
  static int _lastFind = 0;
  static int _maxFind = 0;

  static final User _userSingleton = User._internal();

  factory User() {
    return _userSingleton;
  }

  User._internal();

  static Map<String, dynamic> toMap()  {
    return {
      'id': _id,
      'fylke': _fylke,
      'kommune': _kommune,
      'totalFinds': _totalFinds,
      'lastFind': _lastFind,
      'maxFind': _maxFind,
    };
  }

  static fromMap(Map<String, dynamic> userMap)  {
    _fylke = userMap['fylke'];
    _kommune = userMap['kommune'];
    _totalFinds = userMap['totalFinds'];
    _lastFind = userMap['lastFind'];
    _maxFind = userMap['maxFind'];
  }

  @override
  String toString() {
    return  'Fylke: $_fylke\n'
            'Kommune: $_kommune\n'
            'Mine funn: $_totalFinds\n'
            'Forrige funn: $_lastFind\n'
            'Max funn: $_maxFind';
  }  
}