import 'package:flutter/material.dart';
import 'package:slugflutter/widgets/round_cancel_button.dart';
import 'package:slugflutter/ui/themes/theme.dart';


class AppInfo extends StatelessWidget {
  AppInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme.backgroundColor,
      body: Center(  
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                "App Info",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                color: CustomTheme.getTheme.textSelectionColor,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Text(
                "En app for å lage statestikk basert på fangst av brunsnegler i Norge. Hver vår og sommer blir brunsnegler et tema for småprat blant naboer og venner. Tenkte derfor at det hadde vært gøy å lage en nasjonal statestikk for denne aktiviteten.",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:  CancelButton()
    );
  }
}