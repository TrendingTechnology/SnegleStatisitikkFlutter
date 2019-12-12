class User  {
  final int id;
  String kommune;
  String fylke;

  User({this.id, this.kommune, this.fylke});

  Map<String, dynamic> toMap()  {
    return {
      'id': id,
      'fylke': fylke,
      'kommune': kommune
    };
  }
}