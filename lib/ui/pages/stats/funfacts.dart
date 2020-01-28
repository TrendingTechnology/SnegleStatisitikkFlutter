import 'package:SnegleStatistikkflutter/database/controllers/APIcontroller.dart';
import 'package:SnegleStatistikkflutter/database/mutations/mutations.dart';
import 'package:SnegleStatistikkflutter/database/queries/queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/database/controllers/localDBcontroller.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';
import 'package:SnegleStatistikkflutter/widgets/round_cancel_button.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Funfacts extends StatefulWidget {

  @override
  _FunfactsState createState() => _FunfactsState();
}

class _FunfactsState extends State<Funfacts> {

  String _kommuneAndCount;
  String _fylkeAndCount;
  String _mostFindingsAndDate;
  int _averageFindCount;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: Queries.getKommuneWithMostFindings()
      ),
      builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
        if (result.loading)  {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: CustomTheme.getTheme.backgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.getTheme.textSelectionColor),
            )
          );
        }
        if (result.hasException)  {
          return Center(
            child: Text("${result.exception}")
          );
        }
        _kommuneAndCount = result.data != null ? result.data['getKommuneWithMostFindings']['kommune'] : 'NA';
        return Query(
          options: QueryOptions(
            documentNode: Queries.getFylkeWithMostFindings()
          ),
          builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
            if (result.loading)  {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: CustomTheme.getTheme.backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.getTheme.textSelectionColor),
                )
              );
            }
            if (result.hasException)  {
              return Center(
                child: Text("${result.exception}")
              );
            }
            _fylkeAndCount = result.data != null ? result.data['getFylkeWithMostFindings']['fylke'] : 'NA';
            return Query(
              options: QueryOptions(
                documentNode: Queries.getMostFindingsAndDate()
              ),
              builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
                if (result.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: CustomTheme.getTheme.backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.getTheme.textSelectionColor),
                    )
                  );
                }
                if (result.hasException)  {
                  return Center(
                    child: Text("${result.exception}")
                  );
                }
                _mostFindingsAndDate = result.data['getMostFindingsAndDate'] != null ? result.data['getMostFindingsAndDate']['date'] : 'NA';
                return Query(
                  options: QueryOptions(
                    documentNode: Queries.getAverageFindCount()
                  ),
                  builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
                    if (result.hasException)  {
                      return Center(
                        child: Text("${result.exception}")
                      );
                    }
                    _averageFindCount = result.data != null ? result.data['getAverageFindCount'] : 0;
                    return _funfacts();
                  },
                );
              },
            );
          },
        );
      }
    );
  }

  Widget _funfacts() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child:SafeArea(
        child: Scaffold(
          backgroundColor: CustomTheme.getTheme.backgroundColor,
          body: Center(  
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Funfacts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.getTheme.textSelectionColor
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Divider(
                    color: CustomTheme.getTheme.textSelectionColor,
                  ),
                ),
                Text("Kommune med flest fangster",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text('$_kommuneAndCount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.getTheme.textSelectionColor,
                    ),
                  ),
                ),
                Text("Fylke med flest fangster",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text('$_fylkeAndCount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.getTheme.textSelectionColor,
                    ),
                  ),
                ),
                Text("Dato flest fanget",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text("$_mostFindingsAndDate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.getTheme.textSelectionColor,
                    ),
                  ),
                ),
                Text("Snitt fangst",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text('$_averageFindCount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.getTheme.textSelectionColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton:  CancelButton()
        )
      )
    );
  }

  Future<void> _refresh() async {
    setState(() {
      
    });
  }
}