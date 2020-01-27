import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/database/controllers/localDBcontroller.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';
import 'package:SnegleStatistikkflutter/widgets/round_cancel_button.dart';

class Funfacts extends StatefulWidget {

  @override
  _FunfactsState createState() => _FunfactsState();
}

class _FunfactsState extends State<Funfacts> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        LocalDBController.getAllSimpleUserData(), 
        LocalDBController.getAllUserFindings()
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var allQueryResults = snapshot.data;

          return Center(
            child: Text("$allQueryResults"),
          );
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

  /* Widget _myStats() {
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
  } */
}