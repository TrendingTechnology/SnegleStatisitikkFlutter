class User  {
  final int id;
  String kommune;
  String fylke;
  int totalFinds;
  int lastFind;
  int maxFind;

  User({this.id, this.kommune, this.fylke});

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
}