class Find {
  String kommune;
  String fylke;
  int count;
  int date;

  Find({this.kommune, this.fylke, this.count, this.date});

  Map<String, dynamic> toMap()  {
    return {
      'kommune': kommune,
      'fylke': fylke,
      'count': count,
      'date': date,
    };
  }

}