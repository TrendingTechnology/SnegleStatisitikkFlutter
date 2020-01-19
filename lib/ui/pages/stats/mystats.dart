import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/database/controllers/localDBcontroller.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';
import 'package:SnegleStatistikkflutter/widgets/round_cancel_button.dart';

class MyStats extends StatefulWidget {

  @override
  _MyStatsState createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {

  static int _lastFind;
  static int _averageFind = 0;
  static String _dateMostFound;
  static int _maxFind;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        LocalDBController.getAllSimpleUserData(), 
        LocalDBController.getAllUserFindings()
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var user = snapshot.data[0];
          _lastFind = user['lastFind'];
          _maxFind = user['maxFind'];
          List<Map<String, dynamic>> findings = List<Map<String, dynamic>>.from(snapshot.data[1]); //Make new list so that it may be sorted.
          findings.sort((a, b) => b["find"].compareTo(a["find"])); // Sort list of findings by number of findings in decending order.
          try {
            _dateMostFound = findings[0]['date'];
            _averageFind = (user['totalFinds']/findings.length).floor();
          } catch (e) {
            _dateMostFound = "NA";
            print("No stats to show!");
          } // After sort, assign the date of the highest value to _dateMostFound 
          return _myStats();
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: CustomTheme.getTheme.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.getTheme.textSelectionColor),
          )
        );
      },
    );
  }

  Widget _myStats() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.getTheme.backgroundColor,
        body: Center(  
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Min statistikk',
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
              Text("Forrige fangst",
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
                child: Text('$_lastFind',
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
                child: Text("$_averageFind",
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
                child: Text("$_dateMostFound",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                  ),
                ),
              ),
              Text("Max fangst",
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
                child: Text('$_maxFind',
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
    );
  }
}