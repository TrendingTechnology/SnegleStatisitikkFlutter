//Singleton, only one user in this app locally, no login or users in the backend.
class User {
  static String _fylke;
  static String _kommune;
  static int _totalFinds = 0;
  static int _lastFind = 0;
  static int _maxFind = 0;

  static final User _singleton = User._internal();

  factory User() {
    return _singleton;
  }

  User._internal();

  static set setFylke(String fylke)  {
    _fylke = fylke;
  }

  static set setKommune(String kommune) {
    _kommune = kommune;
  }

  static set setTotalFinds(int totalFinds)  {
    _totalFinds = totalFinds;
  }

  static set setLastFind(int lastFind)  {
    _lastFind = lastFind;
  }

  static set setMaxFind(int maxFind)  {
    _maxFind = maxFind;
  }

  static get getFylke  {
    return _fylke;
  }

  static get getKommune  {
    return _kommune;
  }

  static get getTotalFinds  {
    return _totalFinds;
  }

  static get getLastFind {
      return _lastFind;
    }

  static get getMaxFind {
    return _maxFind;
  }

  static addFind(int lastFind) {
    _lastFind = lastFind;
    _maxFind = lastFind > _maxFind ? lastFind : _maxFind;
    _totalFinds += lastFind;
  }

  static Map<String, dynamic> toMap()  {
    return {
      'fylke': _fylke,
      'kommune': _kommune,
      'totalFinds': _totalFinds,
      'lastFind': _lastFind,
      'maxFind': _maxFind,
    };
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