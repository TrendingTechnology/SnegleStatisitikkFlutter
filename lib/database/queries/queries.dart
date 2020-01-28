import 'package:gql/ast.dart';
import "package:gql/language.dart" as lang;

/// Querie strings to do queries on the Firebase Firestore
class Queries {
  static DocumentNode getSlugfindingsByKommune() {
    return lang.parseString(r"""
      query getSlugfindingByKommune($kommune: String!){
        getSlugfindingsByKommune(kommune: $kommune)	{
          count
        }
      }
    """);
  }

  static DocumentNode getSlugfindingsByFylke() {
    return lang.parseString(r"""
      query getSlugfindingByFylke($fylke: String!){
        getSlugfindingsByFylke(fylke: $fylke)	{
          count
        }
      }
    """);
  }

  static DocumentNode getSlugfindingsByDate() {
    return lang.parseString(r"""
      query getSlugfindingByDate($date: String!){
        getSlugfindingsByDate(date: $date)	{
          count
        }
      }
    """);
  }

  static DocumentNode getKommuneWithMostFindings()  {
    return lang.parseString(r"""
    query getKommuneWithMostFindings()  {
      getKommuneWithMostFindings{
        count,
        kommune
      }
    }
    """);
  }

  static DocumentNode getFylkeWithMostFindings()  {
    return lang.parseString(r"""
      query getFylkeWithMostFindings()  {
        getFylkeWithMostFindings{
          count,
          fylke
        }
      }
      """);
  }

  static DocumentNode getAverageFindCount() {
    return lang.parseString(r"""
      query getAverageFindCount()  {
        getAverageFindCount
      }
      """);

  }

  static DocumentNode getMostFindingsAndDate()  {
    return lang.parseString(r"""
      query getMostFindingsAndDate()  {
        getMostFindingsAndDate{
          date,
          count
        }
      }
      """);
  }
}