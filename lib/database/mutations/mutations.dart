import 'package:gql/ast.dart';
import "package:gql/language.dart" as lang;

class Mutations {
  static DocumentNode addFindingsMutation() {
    return lang.parseString(r"""
      mutation addSlugFinding($kommune: String!, $fylke: String!, $count: Int!){
        addSlugfinding(
          kommune: $kommune,
          fylke: $fylke,
          count: $count
        ) 
        { 
          kommune
        }
      }
    """);
  }
}