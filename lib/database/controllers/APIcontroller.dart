// Controller to mutate and query a MongoDB with graphql

class APIController {
  static Map<String, dynamic> addFinding(String kommune, String fylke, int count)  {
    return  {
              'kommune': kommune,
              'fylke': fylke,
              'count': count
            };
  }

  static queryFindingByFylke(String fylke) {

  }

  static queryFindingByKommune(String kommune)  {

  } 
  
  // Example: "14.12.2019"
  static queryFindingByDate(String date)  {
    
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