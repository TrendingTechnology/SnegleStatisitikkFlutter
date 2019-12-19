class Find {
  static String kommune;
  static String fylke;
  static int count;
  static String date;
  static String time;

  Find(fylke, kommune, count, date, time);

  static Map<String, dynamic> toJson()  {
    return {
      'fylke': fylke,
      'kommune': kommune,
      'count': count,
      'date': date,
      'time': time
    };
  }

  static Find fromJson(Map<String, dynamic> find)  {
    fylke = find['fylke'];
    kommune = find['kommune'];
    count = find['antall'];
    date = find['date'];
    time = find['time'];

    return Find(
      kommune,
      fylke,
      count,
      date,
      time
    );
  }

}