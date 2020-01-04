import 'package:gql/ast.dart';
import "package:gql/language.dart" as lang;

/// Mutation strings to do mutations on the Firebase Firestore
class Mutations {
  /// Adding a finding to the Firebase Firetore
  static DocumentNode addFindingsMutation() {
    return lang.parseString(r"""
      mutation addSlugFinding($kommune: String!, $fylke: String!, $count: Int!, $date: String!, $time: String!){
        addSlugfinding(
          kommune: $kommune,
          fylke: $fylke,
          count: $count,
          date: $date,
          time: $time
        ) 
        { 
          kommune
        }
      }
    """);
  }
}