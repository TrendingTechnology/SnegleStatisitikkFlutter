import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slugflutter/ui/themes/theme.dart';
import 'package:slugflutter/widgets/round_cancel_button.dart';

class MyStats extends StatelessWidget {

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
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                color: CustomTheme.getTheme.textSelectionColor,
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton:  CancelButton()
    );
  }
}