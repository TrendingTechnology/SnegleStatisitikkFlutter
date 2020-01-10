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
      query getSlugfindingByFylke($date: String!){
        getSlugfindingsByFylke(date: $date)	{
          count
        }
      }
    """);
  }
}