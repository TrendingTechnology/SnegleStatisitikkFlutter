class User {
  int id;
  String fylke = '';
  String kommune = '';
  int totalFinds = 0;
  int lastFind = 0;
  int maxFind = 0;

  User({
    this.id,
    this.fylke,
    this.kommune,
    this.totalFinds,
    this.lastFind,
    this.maxFind
  });

  set setKommune(String kommune) {
    this.kommune = kommune;
  }

  set setFylke(String fylke)  {
    this.fylke = fylke;
  }

  get getKommune  {
    return this.kommune;
  }

  get getFylke  {
    return this.fylke;
  }

  Map<String, dynamic> toMap()  {
    return {
      'id': id,
      'fylke': fylke,
      'kommune': kommune,
      'totalFinds': totalFinds,
      'lastFind': lastFind,
      'maxFind': maxFind,
    };
  }

  User fromMap(Map<String, dynamic> userMap)  {
    return User(
      id: userMap[id],
      fylke: userMap[fylke],
      kommune: userMap[kommune],
      totalFinds: userMap[totalFinds],
      lastFind: userMap[lastFind],
      maxFind: userMap[maxFind]
    );
  }
}